import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_dart_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterState(counterValue: 0));

    void counterIncrement(){
      emit(CounterState(counterValue: state.counterValue +1));
    }

    void counterDecrement(){
      emit(CounterState(counterValue: state.counterValue -1));
    }
}
