class CounterState {
  late int counter;

  // create a private constructor
  CounterState._();

  factory CounterState.initial() {
    return CounterState._()..counter = 0;
  }
}
