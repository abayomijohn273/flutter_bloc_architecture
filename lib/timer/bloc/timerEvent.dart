import 'package:flutter/foundation.dart';

abstract class TimerEvent {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends TimerEvent {
  final int duration;
  StartEvent({@required this.duration});

  @override
  String toString() => "StartEvent: {duration: $duration}";
}

class PausedEvent extends TimerEvent {}

class ResumeEvent extends TimerEvent {}

class ResetEvent extends TimerEvent {}

class Tick extends TimerEvent {
  final int duration;
  const Tick({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "Tick: {duration: $duration}";
}
