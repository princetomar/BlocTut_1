import 'package:bloc/bloc.dart';
import 'package:flutter_bloc2/counter_event.dart';
import 'package:flutter_bloc2/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial());

  void onIncrement() {
    dipatch(IncrementEvent());
  }

  void onDecrement() {
    dipatch(DecrementEvent());
  }

  // initialState override method returns us the initial state, and for us the initial state
  // is a counter state that initial which is the factory we have created and map event to state
  // that needs to be an async generator, this is also the reason why it returns
  // a stream
  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(
    CounterState currentState,
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield currentState..counter += 1;
    } else if (event is DecrementEvent) {
      yield currentState..counter -= 1;
    }
  }

  // dispose function to dispose the counter bloc
  void dispose() {
    close();
  }

  void dipatch(CounterEvent incrementEvent) {}
}
