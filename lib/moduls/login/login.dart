



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopapp/layout/shop_layout.dart';


import 'package:shopapp/moduls/login/cubit/loginCubit.dart';
import 'package:shopapp/moduls/login/cubit/loginState.dart';

import 'package:shopapp/moduls/register/register_screen.dart';
import 'package:shopapp/shared/componants/componants.dart';
import 'package:shopapp/shared/componants/constant.dart';
import 'package:shopapp/shared/sharedpreference/cachhelper.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextEditingController? email= new TextEditingController();
    TextEditingController? password=new TextEditingController();
    String? value=email.text;
    var keyForm=GlobalKey<FormState>();

        return BlocConsumer<LoginCubit,LoginState>(
          listener: (context,state){
            if(state is LoginSuccessState){
              if(state.loginModel!.state){
                print(state.loginModel!.state);
                print(state.loginModel!.message);
                showToast(message: state.loginModel!.message!, state: ToastState.SUCCESS);
                CachHelper.putData(key: 'token', value: state.loginModel!.data!.token ).then((value) {
                  token=state.loginModel!.data!.token;
                  navigateAndFinish(context, ShopLayout());
                });

              }else{
                print(state.loginModel!.state);
                print(state.loginModel!.message);
              showToast(message: state.loginModel!.message!, state: ToastState.ERROR);
              }
            }
          },
          builder:  (context,state){

            var cubit=LoginCubit.get(context);



            return Scaffold(

              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: keyForm,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LOGIN',
                            style:Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Text('login now to our shop for offers',
                            style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black54,fontSize: 18),

                          ),
                          SizedBox(height: 30,),
                          defaultEditText(control: email,
                              validat: ( String?s){
                                if(s!.isEmpty){
                                  return'Email is Empty';
                                }
                                return null;
                              },
                              label: 'Email',
                              prefIcon: Icons.email_outlined,
                              textType: TextInputType.emailAddress
                          ),
                          SizedBox(height: 20,),
                          defaultEditText(control: password,
                              validat: (s){
                                if(s.isEmpty){
                                  return'password is Empty';
                                }
                                return null;
                              },
                              textType:TextInputType.visiblePassword,
                              label: 'Password',
                              enable: cubit.isScure,
                              sufIcon: cubit.suffix,
                              prefIcon: Icons.lock,
                              onPressSuffix: (){
                                cubit.passwordLogin();
                              }
                          ),
                          SizedBox(height: 30,),
                          state is LoginLoadingState? Center(child: CircularProgressIndicator()): defaultButton(
                              onPress: (){

                                if(keyForm.currentState!.validate()){
                                 if (password.text=='') print('mahmoud');
                                  if(email.text=='')print('mahmoud');
                                 cubit.postLogin(emaill: email.text, passwordd: password.text);

                                }else{

                                }
                              },
                              name: 'LOGIN'),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have account?'),
                              defaultTextButton(onPress: (){

                                navigateTo(context, RegisterScreen());
                              }, name: 'Register')
                            ],)


                        ],),
                    ),
                  ),
                ),
              ),
            );
          },

        );



  }
}
