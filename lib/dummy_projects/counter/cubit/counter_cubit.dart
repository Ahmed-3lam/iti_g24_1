import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int counterText = 0;

  /// (2) method
  void increment() {
    counterText++;
    emit(CounterTextChange());
  }
}
