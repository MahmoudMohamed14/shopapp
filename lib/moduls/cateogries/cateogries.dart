import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/shopcubit/shopcubit.dart';
import 'package:shopapp/layout/shopcubit/shopstates.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
        builder:(context,state){
        var cubit=ShopCubit.get(context);
        return ListView.separated(
            scrollDirection:Axis.vertical ,
          physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>Padding(
              padding: const EdgeInsets.all(10),
              child: Row(


                children: [
                  Image(
                      width: 150,
                      height: 150,
                      image: NetworkImage('${cubit.categoriesModel!.data.dataModel[index].image}')
                  ),
                  SizedBox(width: 10,),
                  Text(
                    '${cubit.categoriesModel!.data.dataModel[index].name}',
                   maxLines: 1,

                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            separatorBuilder:(context,index)=>SizedBox(width: 10,),
            itemCount: cubit.categoriesModel!.data.dataModel.length);},


    );
  }
  Widget buildCategory(){
    return Column();
  }
}
