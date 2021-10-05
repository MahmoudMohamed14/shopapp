import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/shop_layout.dart';
import 'package:shopapp/layout/shopcubit/shopcubit.dart';
import 'package:shopapp/layout/shopcubit/shopstates.dart';
import 'package:shopapp/moduls/login/cubit/loginCubit.dart';
import 'package:shopapp/moduls/login/cubit/loginState.dart';
import 'package:shopapp/shared/componants/componants.dart';
import 'package:shopapp/shared/componants/constant.dart';
import 'package:shopapp/shared/sharedpreference/cachhelper.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var email=TextEditingController();
    var name=TextEditingController();
    var phone=TextEditingController();
    var password=TextEditingController();
    var val=GlobalKey<FormState>();
    return BlocConsumer<LoginCubit,LoginState>(
          listener: (context,state){
            if(state is ShopSuccessRegisterState){
              if(state.loginModel!.state){
                showToast(message: state.loginModel!.message!, state: ToastState.SUCCESS);
           CachHelper.putData(key: 'token', value: state.loginModel!.data!.token ).then((value) {
             token = state.loginModel!.data!.token;
             navigateAndFinish(context,ShopLayout());
           });

              }else
                showToast(message: state.loginModel!.message!, state: ToastState.ERROR);
            }
          },
          builder:(context,state){

            return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: val,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        if(state is ShopLoadingRegisterState)
                          LinearProgressIndicator(),
                        SizedBox(height: 15,),
                        Text('Register',
                          style:Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                        ),
                        SizedBox(height: 10,),
                        Text('Register now to our shop for offers',
                          style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black54,fontSize: 18),

                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: name,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                            labelText: 'name',
                            prefixIcon:  Icon(Icons.person),
                          ),
                          validator: ( String? s){
                            if(s!.isEmpty){
                              return'name is empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(

                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                            labelText: 'email',

                            prefixIcon:  Icon(Icons.email_outlined),

                          ),


                          validator: ( String? s){

                            if(s!.isEmpty){
                              return'email is empty';
                            }
                            return null;

                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),

                            labelText: 'phone',
                            prefixIcon:  Icon(Icons.phone),

                          ),


                          validator: ( String? s){

                            if(s!.isEmpty){
                              return'phone is empty';
                            }
                            return null;

                          },



                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: password,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),

                            labelText: 'password',
                            prefixIcon:  Icon(Icons.lock),

                          ),


                          validator: ( String? s){

                            if(s!.isEmpty){
                              return'password is empty';
                            }
                            return null;

                          },
                        ),
                        SizedBox(height: 15,),
                        defaultButton(onPress: (){
                          if(val.currentState!.validate()){
                            LoginCubit.get(context).register(name: name.text,
                                email: email.text, phone: phone.text, password: password.text);
                          }

                        }, name: 'SIGNUP')
                      ],
                    ),
                  ),
                ),
              ),
            );}

      );

  }
}
