import 'package:shopapp/models/loginmodel.dart';

abstract class LoginState{}
 class LoginInitState extends LoginState{}
class LoginPasswordState extends LoginState{}
class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState{
   LoginModel? loginModel;
  LoginSuccessState({this.loginModel});
}
class LoginErrorState extends LoginState{
  String?error;
  LoginErrorState({this.error});
}
class DarkStatesApp extends LoginState{}
class ShopLoadingRegisterState extends LoginState{}
class ShopSuccessRegisterState extends LoginState{
  LoginModel ?loginModel;
  ShopSuccessRegisterState({this.loginModel});
}
class ShopErrorRegisterState extends LoginState{
  String?error;
  ShopErrorRegisterState( {this.error});
}