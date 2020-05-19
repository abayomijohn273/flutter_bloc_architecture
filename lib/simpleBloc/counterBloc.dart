import 'dart:async';
import 'counterEvent.dart';

class CounterBloc {
  int _counter = 0;
  //
  // Create a state controller using a stream controller
  final _counterStateController = StreamController<int>();
  // sink is input
  StreamSink<int> get _intCounter => _counterStateController.sink;
  // for state, exposing only a stream which outputs data
  Stream<int> get counter => _counterStateController.stream;

  // Create an event controller
  final _counterEventController = StreamController<CounterEvent>();
  // for events, exposing only a sink which is an input
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    // whenever there is a new event, we want to map it to a new state
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is DecrementEvent) {
      _counter--;
    } else {
      _counter = 0;
    }

    _intCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
