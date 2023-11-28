part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncrased extends CounterEvent {
  final int value;
  const CounterIncrased(this.value);
}

class CounterReset extends CounterEvent {}