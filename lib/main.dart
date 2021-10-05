import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopapp/layout/shop_layout.dart';
import 'package:shopapp/moduls/login/cubit/loginCubit.dart';
import 'package:shopapp/moduls/login/cubit/loginState.dart';
import 'package:shopapp/moduls/login/login.dart';
import 'package:shopapp/shared/bloc_observer.dart';
import 'package:shopapp/shared/componants/constant.dart';
import 'package:shopapp/shared/cubit/cubit.dart';

import 'package:shopapp/shared/network/remot/dio_helper.dart';
import 'package:shopapp/shared/sharedpreference/cachhelper.dart';
import 'package:shopapp/shared/styles/theme.dart';


import 'layout/shopcubit/shopcubit.dart';
import 'moduls/on_boarding/on_boarding_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();
  bool ?onBoarding=CachHelper.getBoolean(key: 'onBoarding');
  token=CachHelper.getString(key: 'token');
  Widget startWidget=OnBoardingScreen();
  if(onBoarding!=null){
    if(token!=null){
      startWidget=ShopLayout();
    }else{
      startWidget=LoginScreen();
    }

  }
  else{
    startWidget=OnBoardingScreen();
  }
  runApp(MyApp(startWidget: startWidget,));
}

class MyApp extends StatelessWidget {

   Widget startWidget;
  
  MyApp({ required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>CubitApp()),
        BlocProvider(create: (BuildContext context)=>LoginCubit()),
       BlocProvider( create: (BuildContext context)=>ShopCubit()..getHomeShop()..getCategoryShop()..getFavoriteShop()..getMyProfile()),
      ],
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){},
        builder: (context,state)=> MaterialApp(
          debugShowCheckedModeBanner: false,

          theme:lightMode,
        darkTheme: darkMode,
          themeMode:LoginCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light

          ,

          home: startWidget
        ),

      ),
    );
  }
}


