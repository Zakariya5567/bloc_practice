abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterUpdateState extends CounterStates {
  final int counterValue;
  CounterUpdateState(this.counterValue);
}
