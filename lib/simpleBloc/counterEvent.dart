// Basiic BLOC pattern flow
// EVENT => BLOC => STATE

abstract class CounterEvent{}

class IncrementEvent extends CounterEvent{}

class DecrementEvent extends CounterEvent{}

class ResetEvent extends CounterEvent{}