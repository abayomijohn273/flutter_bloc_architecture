import 'dart:async';
import "package:meta/meta.dart";
import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/timer/ticker.dart';
import 'timerState.dart';
import 'timerEvent.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  // create the ticker dependency
  final Ticker _ticker;
  final int _duration = 60;

  // Subscribe to the stream
  StreamSubscription<int> _tickerSubstription;

  TimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker;

  TimerState get initialState => ReadyState(_duration);

  @override
  Future<void> close() {
    _tickerSubstription?.cancel();
    return super.close();
  }

  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is StartEvent) {
      yield* _mapStartToState(event);
    } else if (event is PausedEvent) {
      yield* _mapPausedToState(event);
    } else if (event is ResumeEvent) {
      yield* _mapResumedToState(event);
    } else if (event is ResetEvent) {
      yield* _mapResetToState(event);
    } else if (event is Tick) {
      yield* _mapTickToState(event);
    }
  }

  Stream<TimerState> _mapStartToState(StartEvent start) async* {
    yield RunningState(start.duration);
    _tickerSubstription?.cancel();
    _tickerSubstription = _ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(Tick(duration: duration)));
  }

  Stream<TimerState> _mapTickToState(Tick tick) async* {
    yield tick.duration > 0 ? RunningState(tick.duration) : FinishedState();
  }

  Stream<TimerState> _mapPausedToState(PausedEvent paused) async* {
    if (state is RunningState) {
      _tickerSubstription?.pause();
      yield PausedState(state.duration);
    }
  }

  Stream<TimerState> _mapResumedToState(ResumeEvent resume) async* {
    if (state is PausedState) {
      _tickerSubstription?.resume();
      yield RunningState(state.duration);
    }
  }

  Stream<TimerState> _mapResetToState(ResetEvent reset) async* {
    _tickerSubstription?.cancel();
    yield ReadyState(_duration);
  }
}
