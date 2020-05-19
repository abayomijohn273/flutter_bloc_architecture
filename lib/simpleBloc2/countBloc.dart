import 'dart:async';
import 'counterEvent.dart';

class CounterBloc {
  int _counter = 0;

  // Control thwe state since Event=>BLOC=>State
  // So the state pass throw the stream(like a pipe)
  StreamController<int> _counterStateController = StreamController<int>();
  // first we need to sink the data collected from the event sink
  StreamSink<int> get _counterStreamSink => _counterStateController.sink;
  // the data will go through the stream to output
  Stream<int> get counter => _counterStateController.stream;

  // Control the event too
  // so the event will sink since its going to be trigger from the ui
  //
  StreamController<CounterEvent> _counterEventController =
      StreamController<CounterEvent>();
  // Since the event is coming in, so we sink it into the pipe
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  // The constructor
  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is DecrementEvent) {
      _counter--;
    } else if (event is IncrementIFive) {
      _counter += 5;
    } else {
      _counter = 0;
    }
    _counterStreamSink.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
