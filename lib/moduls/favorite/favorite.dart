


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/shopcubit/shopcubit.dart';
import 'package:shopapp/layout/shopcubit/shopstates.dart';
import 'package:shopapp/models/favorites_data_model.dart';
import 'package:shopapp/shared/componants/componants.dart';


class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return ConditionalBuilder(
            condition: state is! ShopLoadingFavoriteState,
            builder: (context)=> ListView.separated(
                scrollDirection:Axis.vertical ,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildProductItem(context: context,product:cubit.favoritesDataModel!.dataModel.data![index].product!),
                separatorBuilder:(context,index)=>SizedBox(width: 10,),
                itemCount: cubit.favoritesDataModel!.dataModel.data!.length)

            , fallback: ( context)=>Center(child: CircularProgressIndicator()),

          );
        }
    );

  }

}