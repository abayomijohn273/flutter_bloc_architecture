abstract class CounterState {
  final counter;
  CounterState(this.counter);

  @override
  List<Object> get props => [counter];
}

class StartState extends CounterState {
  final counter;
  StartState(this.counter) : super(counter);

  @override
  String toString() => "Ready: {counter: $counter}";
}

class ResetState extends CounterState {
  final counter;
  ResetState(this.counter) : super(0);

  @override
  String toString() => "Reset: {counter: $counter}";
}
