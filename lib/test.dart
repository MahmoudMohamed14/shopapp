import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/moduls/login/cubit/loginCubit.dart';
import 'package:shopapp/moduls/login/cubit/loginState.dart';
import 'package:shopapp/moduls/register/register_screen.dart';
import 'package:shopapp/shared/componants/componants.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cont=TextEditingController();
    var val=GlobalKey<FormState>();
    return BlocProvider<LoginCubit>(
      create: ( BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){},
        builder:(context,state)=>Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: val,
              child: Column(
                children: [
                  Text('Test'),
                  SizedBox(height: 20,),
                  TextFormField(
                   obscureText: LoginCubit.get(context).isScure,
                    controller: cont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                      labelText: 'email',

                      prefixIcon:  Icon(Icons.email_outlined),
                      suffixIcon:IconButton(onPressed: (){
                        LoginCubit.get(context).passwordLogin();
                      },icon: Icon(LoginCubit.get(context).suffix),)

                    ),


                  validator: ( String? s){

                      if(s!.isEmpty){
                        return'email is empty';
                      }
                      return null;

                    },



                  ),
                  SizedBox(height: 15,),
                  defaultButton(onPress: (){
                    if(val.currentState!.validate()){
                      print(cont.text);
                      navigateTo(context, RegisterScreen());
                    }
                  }, name: 'LOGIN')


                ],
              ),
            ),
          ),
        ) ,

      ),
    );
  }
}
