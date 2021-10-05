import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/shopcubit/shopstates.dart';
import 'package:shopapp/models/categories_model.dart';
import 'package:shopapp/models/favoritemodel.dart';
import 'package:shopapp/models/favorites_data_model.dart';
import 'package:shopapp/models/homemodel.dart';
import 'package:shopapp/models/loginmodel.dart';
import 'package:shopapp/models/search_model.dart';
import 'package:shopapp/moduls/cateogries/cateogries.dart';
import 'package:shopapp/moduls/favorite/favorite.dart';
import 'package:shopapp/moduls/product/products.dart';
import 'package:shopapp/moduls/setting/setting.dart';
import 'package:shopapp/shared/componants/componants.dart';
import 'package:shopapp/shared/componants/constant.dart';
import 'package:shopapp/shared/network/end_point.dart';
import 'package:shopapp/shared/network/remot/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitState());
  static ShopCubit get(context) {
    return BlocProvider.of(context);
  }
  int index=0;
  List<Widget>screen=[
    ProductScreen()
    ,CategoriesScreen(),
    FavoriteScreen(),
    SettingScreen()
  ];
  Map<int,bool>favorite={};
   changeBottomNav({required int newIndex}){
    index=newIndex;
    emit(ShopChangeNavState());
  }
   HomeModel ?homeModel;
  void getHomeShop(){
    emit(ShopLoadingHomeState());


      DioHelper.get(pass:HOME,token: token ).then((value) {
        homeModel = HomeModel.fromJson(value.data);
        print(homeModel!.status);
        print(homeModel!.homeDataModel.banners![2].id);
        homeModel!.homeDataModel.products!.forEach((element) {
          favorite.addAll({element.id!:element.in_favorite!});

        });
        print(favorite);

        emit(ShopSuccessHomeState());

      }).catchError((error){
        print('shopErrorHome :'+error.toString());
        emit(ShopErrorHomeState(error: error.toString()));

      });


  }
  CategoriesModel? categoriesModel;
  void getCategoryShop(){
    emit(ShopLoadingCategoryState());


      DioHelper.get(pass:CATEGORIES, ).then((value) {
       categoriesModel = CategoriesModel.fromJson(value.data);
        print('category');
        print(value.data);
      //  print(homeModel!.homeDataModel.banners![2].id);

        emit(ShopSuccessCategoryState());

      }).catchError((error){
        print('shopErrorCategory :'+error.toString());
        emit(ShopErrorCategoryState(error: error.toString()));

      });


  }
  ChangeFavorite ?changeFavorite;
  void changeFavoriteShop({required int id}){
    favorite[id]=!favorite[id]!;


    emit(ShopChangeFavoriteState());
    DioHelper.postData(pass:FAVORITES,token:token,data: {'product_id':id},  ).then((value) {
      changeFavorite=ChangeFavorite.fromJson(value.data);
      print(token);
      print(value.data);
      //  print(homeModel!.homeDataModel.banners![2].id);
      if(!changeFavorite!.status){
        favorite[id]=!favorite[id]!;
        showToast(message: changeFavorite!.message, state: ToastState.ERROR);
      }else{
        getFavoriteShop();
      }

      emit(ShopChangeSuccessFavoriteState());

    }).catchError((error){
      favorite[id]=!favorite[id]!;
      showToast(message: changeFavorite!.message, state: ToastState.ERROR);
      print('shopErrorFavorite :'+error.toString());
      emit(ShopChangeErrorFavoriteState(error: error.toString()));

    });


  }
  FavoritesDataModel ?favoritesDataModel;
  void getFavoriteShop(){



    emit(ShopLoadingFavoriteState());
    DioHelper.get(pass:FAVORITES ,token: token ).then((value) {
      favoritesDataModel=FavoritesDataModel.fromJson(value.data);
      print(token);
      print(value.data);
      //  print(homeModel!.homeDataModel.banners![2].id);


      emit(ShopSuccessFavoriteState());

    }).catchError((error){

      print('shopErrorFavorite :'+error.toString());
      emit(ShopErrorFavoriteState(error: error.toString()));

    });


  }
  LoginModel? loginModel;
  void getMyProfile(){



    emit(ShopLoadingGetProfileState());
    DioHelper.get(pass:PROFILE ,token: token! ).then((value) {
      loginModel=LoginModel.fromJson(value.data);
      print(token);
      print(value.data);



      emit(ShopSuccessGetProfileState());

    }).catchError((error){

      print('shopError my profile :'+error.toString());
      emit(ShopErrorGetProfileState(error: error.toString()));

    });


  }
  void upDateProfile(
  {
  required String name,
    required String email,
    required String phone,
}
      ){



    emit(ShopLoadingUpDateProfileState());
    DioHelper.putData(pass:UPDATE_PROFILE,token: token, data: {'name':'$name','email':'$email','phone':'$phone'} ).then((value) {
      loginModel=LoginModel.fromJson(value.data);
      print(token);
      print(value.data);



      emit(ShopSuccessUpDateProfileState());

    }).catchError((error){

      print('shopError my profile :'+error.toString());
      emit(ShopErrorUpDateProfileState(error: error.toString()));

    });


  }




}