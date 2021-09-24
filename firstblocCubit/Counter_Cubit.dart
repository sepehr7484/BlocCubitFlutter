import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'Counter_State.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(CounterState(
          count: 0,
        ));

  void increment() => emit(CounterState(
        count: state.count + 1,
      ));
  void decrement() => emit(CounterState(
        count: state.count - 1,
      ));
}
