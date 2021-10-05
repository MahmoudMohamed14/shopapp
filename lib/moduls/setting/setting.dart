import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/shopcubit/shopcubit.dart';
import 'package:shopapp/layout/shopcubit/shopstates.dart';
import 'package:shopapp/moduls/login/cubit/loginCubit.dart';
import 'package:shopapp/moduls/login/login.dart';
import 'package:shopapp/shared/componants/componants.dart';
import 'package:shopapp/shared/sharedpreference/cachhelper.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var email=TextEditingController();
    var name=TextEditingController();
    var phone=TextEditingController();
    var val=GlobalKey<FormState>();
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){
        },
      builder:(context,state){
        if(ShopCubit.get(context).loginModel!=null) {
          name.text = '${ShopCubit
              .get(context)
              .loginModel!
              .data!
              .name}';
          email.text = '${ShopCubit
              .get(context)
              .loginModel!
              .data!
              .email}';
          phone.text = '${ShopCubit
              .get(context)
              .loginModel!
              .data!
              .phone}';
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: val,
            child: Column(
              children: [
                if(state is ShopLoadingUpDateProfileState)
                LinearProgressIndicator(),
                SizedBox(height: 15,),
                TextFormField(

                  controller: name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),


                      prefixIcon:  Icon(Icons.drive_file_rename_outline),


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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),


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

                  controller: phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),


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
                defaultButton(onPress: (){

                  if(val.currentState!.validate()){
                    ShopCubit.get(context).upDateProfile(name: name.text, email: email.text, phone: phone.text);
                  }

                }, name: 'UPDATE'),
                SizedBox(height: 15,),
                defaultButton(onPress: (){
                  CachHelper.removeData(key: 'token');
                  navigateAndFinish(context, LoginScreen());


                }, name: 'LOGOUT')


              ],
            ),
          ),
        );}

);

  }
}
