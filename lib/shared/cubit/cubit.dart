
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/shared/cubit/state.dart';

class CubitApp extends Cubit<StatesApp> {

 bool isDark=false;
  CubitApp() : super(InitStatesApp());

  static CubitApp get(context) {
    return BlocProvider.of(context);
  }
  void darkMode(){
    isDark=!isDark;
    emit(DarkStatesApp());

  }
}