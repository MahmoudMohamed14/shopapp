
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/shopcubit/shopcubit.dart';
import 'package:shopapp/layout/shopcubit/shopstates.dart';
import 'package:shopapp/moduls/login/login.dart';

import 'package:shopapp/moduls/search/search.dart';
import 'package:shopapp/shared/componants/componants.dart';
import 'package:shopapp/shared/sharedpreference/cachhelper.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit= ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Sella',style: TextStyle(color: Colors.black),),
            actions: [

              IconButton(onPressed: (){


                    navigateTo(context, SearchScreen());


              }, icon: Icon(Icons.search))
            ],
          ),
          body:cubit.screen[cubit.index] ,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: ShopCubit.get(context).index,
            type: BottomNavigationBarType.fixed,
            onTap: (key){
              ShopCubit.get(context).changeBottomNav(newIndex: key);
            },
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),

          ],),
        );
      },

    );
  }
}
