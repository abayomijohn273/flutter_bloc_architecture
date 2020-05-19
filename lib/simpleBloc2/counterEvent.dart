// Event of the app connected to the bloc

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class IncrementIFive extends CounterEvent {}

class ResetEvent extends CounterEvent {}
