import 'package:bloc/bloc.dart';

part 'counter_states.dart';
part 'counter_events.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialCounterState(0)) {
    on<IncrementEvent>(_increment);
  }

  void _increment(event, emit) {
    emit(LoadingCounterState(state.counter));
    emit(LoadedCounterState(state.counter + 1));
  }
}
