import 'package:bloc/bloc.dart';
import "dart:async";

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  int _counter = 0;

  @override
  get initialState => 0;

  @override
  Stream<int> mapEventToState(event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
