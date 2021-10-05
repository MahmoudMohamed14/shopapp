
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopapp/moduls/search/cubit/search_cubit.dart';
import 'package:shopapp/moduls/search/cubit/search_state.dart';
import 'package:shopapp/shared/componants/componants.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textcontrol=TextEditingController();
    var key=GlobalKey<FormState>();

    return BlocProvider(
      create: (context)=>SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textcontrol,
                      validator: (String? s){
                        if(s!.isEmpty){
                          return 'Enter text';
                        }
                        return null;

                      },
                      onChanged: ( String s){
                        if(key.currentState!.validate()){
                          cubit.search(txt: s);
                        }


                      },
                      onFieldSubmitted: ( String s){
                        if(key.currentState!.validate()){
                          cubit.search(txt: s);
                        }


                      },
                      decoration:InputDecoration(
                        labelText: 'search',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(Icons.search),
                      ) ,
                    ),
                    SizedBox(height: 10,),

                    if(state is ShopLoadingSearchState)
                    LinearProgressIndicator(),
                    SizedBox(height: 10,),
                    if(state is ShopSuccessSearchState)
                    Expanded(
                      child: ListView.separated(
                          scrollDirection:Axis.vertical ,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context,index)=>buildProductItem(context: context,product:cubit.searchData!.data!.product[index],isSearch: false),
                          separatorBuilder:(context,index)=>SizedBox(width: 10,),
                          itemCount: cubit.searchData!.data!.product.length,
                    )
                    ),
                  ],
                ),
              ),
            ),
          );



      }),
    );

  }


}