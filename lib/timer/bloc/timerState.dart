abstract class TimerState {
  final int duration;
  TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class ReadyState extends TimerState {
  ReadyState(int duration) : super(duration);

  @override
  String toString() => "ReadyState {duration: $duration}";
}

class RunningState extends TimerState {
  RunningState(int duration) : super(duration);

  @override
  String toString() => "RunningState: {duration: $duration}";
}

class PausedState extends TimerState {
  PausedState(int duration) : super(duration);

  @override
  String toString() => "PasuedState: {duration: $duration}";
}

class FinishedState extends TimerState {
  FinishedState() : super(0);

  @override
  String toString() => "finishedState {duration: $duration}";
}
