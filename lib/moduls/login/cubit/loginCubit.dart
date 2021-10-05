

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/loginmodel.dart';
import 'package:shopapp/moduls/login/cubit/loginState.dart';
import 'package:shopapp/shared/network/end_point.dart';
import 'package:shopapp/shared/network/remot/dio_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());
   LoginModel? loginModel;
  bool isScure=true;
  bool isDark=false;
  IconData suffix=Icons.visibility;
   static LoginCubit get(context){
     return BlocProvider.of(context);


   }
  void darkMode(){
    isDark=!isDark;
    emit(DarkStatesApp());

  }
  void passwordLogin(){

    isScure=!isScure;
    suffix=isScure?Icons.visibility:Icons.visibility_off;
    emit(LoginPasswordState());

  }
  void postLogin({
required String emaill,
    required String passwordd,



}){
     emit(LoginLoadingState());
     DioHelper.postData(
         pass: LOGIN,
         data:{'email':'$emaill','password':'$passwordd'}
     ).then((value) {
       print(value.data);
       loginModel=LoginModel.fromJson(value.data);
       emit(LoginSuccessState(loginModel:loginModel ));
     }).catchError((error){
       emit(LoginErrorState(error: error.toString()));
       print('post login '+error.toString());
     });
}
  void register(
      {
        required String name,
        required String email,
        required String phone,
        required String password,
      }
      ){



    emit(ShopLoadingRegisterState());
    DioHelper.postData(pass:REGISTER, data: {'name':'$name','email':'$email','phone':'$phone','password':'$password'} ).then((value) {
      loginModel=LoginModel.fromJson(value.data);

      print(value.data);



      emit(ShopSuccessRegisterState(loginModel: loginModel));

    }).catchError((error){

      print('shopError Register :'+error.toString());
      emit(ShopErrorRegisterState(error: error.toString()));

    });


  }
}