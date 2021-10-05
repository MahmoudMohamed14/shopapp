import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/shopcubit/shopcubit.dart';
import 'package:shopapp/layout/shopcubit/shopstates.dart';
import 'package:shopapp/models/categories_model.dart';
import 'package:shopapp/models/homemodel.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.homeModel!=null,
              builder: (context)=>productBuilder(cubit.homeModel!,cubit.categoriesModel!,context)

            , fallback: ( context)=>Center(child: CircularProgressIndicator()),

          );
        }
    );

  }
  Widget productBuilder( HomeModel homeModel,CategoriesModel categoriesModel,context){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: homeModel.homeDataModel.banners!.map((e) =>
                  Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
              ).toList(),
              options:CarouselOptions(
                autoPlay: true,
                height: 240,
                initialPage: 0,
                reverse: false,
                autoPlayAnimationDuration: Duration(seconds: 1),
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                  viewportFraction:1


              )
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Categories',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Container(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection:Axis.horizontal ,
                      shrinkWrap: true,
                      itemBuilder: (context,index)=>Stack(
                        alignment: AlignmentDirectional.bottomCenter,

                        children: [
                          Image(
                              width: 150,
                              height: 150,
                              image: NetworkImage('${categoriesModel.data.dataModel[index].image}')
                          ),
                          Container(

                              color: Colors.black.withOpacity(.7),
                              width: 150,


                              child: Text(
                                '${categoriesModel.data.dataModel[index].name}',
                                textAlign: TextAlign.center,
                                maxLines: 1,

                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white,),
                              )
                          ),
                        ],
                      ),
                      separatorBuilder:(context,index)=>SizedBox(width: 10,),
                      itemCount: categoriesModel.data.dataModel.length),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('NewProduct',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Container(
            color: Colors.grey[300 ],
            child: GridView.count(
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1/1.56,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(homeModel.homeDataModel.products!.length
                  , (index) => buildGridProduct(homeModel.homeDataModel.products![index],context)),

            ),
          )
        ],
      ),
    );
  }
  Widget buildGridProduct(ProductsData productsData,context){
    return Container(
      color: Colors.white,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(image: NetworkImage('${productsData.image}'),
                width: double.infinity,

                height: 200,

              ),
              if(productsData.discount!=0)
              Container(

                padding: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                  child: Text('DISCOUNT',style: TextStyle(fontSize: 10,color: Colors.white))
              )
            ],
          ),
       Padding(
         padding: const EdgeInsets.all(12),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Text('${productsData.name}',maxLines: 2,overflow: TextOverflow.ellipsis,),
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text('${productsData.price.round()}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.blue)),
               SizedBox(width: 20,),
               if(productsData.discount!=0)
                 Text('${productsData.oldPrice.round()}',
                   style: TextStyle(color: Colors.grey,
                       decoration: TextDecoration.lineThrough),),
               Spacer(),
               IconButton(
                 padding: EdgeInsets.zero,

                   onPressed: (){
                   print(productsData.id);
                   ShopCubit.get(context).changeFavoriteShop(id: productsData.id!);

                   }
               , icon:CircleAvatar(
                 backgroundColor: ShopCubit.get(context).favorite[productsData.id]!?Colors.blue:Colors.grey,
                 radius: 15,
                   child: Icon(Icons.favorite_border,color: Colors.white,)))
             ],

           )
         ],),
       )



        ],

      ),
    );
  }
}
