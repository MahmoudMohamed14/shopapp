
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/layout/shopcubit/shopcubit.dart';
import 'package:shopapp/models/favorites_data_model.dart';


void navigateTo(context,widget ){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}
void navigateAndFinish(context,widget ){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget),(route)=>false);
}
Widget defaultEditText(
    {
  required TextEditingController   control,
   required String label,
  IconData? prefIcon,
  Function ?onPressSuffix,
  IconData? sufIcon,
 required Function validat,
  bool enable=false,
  TextInputType ?textType
}
)
{

  return TextFormField(

    validator: (String? s){validat( s);},
    obscureText: enable,
    controller: control,
    keyboardType:textType ,
    autocorrect: false,
    decoration:InputDecoration(

   border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
      labelText: label,
      prefixIcon: Icon(prefIcon),
        suffixIcon: IconButton(onPressed:(){
          onPressSuffix!();
        }
        ,icon: Icon(sufIcon),
        )

    ) ,



  );

}
Widget defaultButton(
{
  required Function onPress,
  required String name,
  double width=double.infinity

}
    )=>Container(
  decoration:BoxDecoration(
    borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlue

  ) ,


  height: 50,
      width:width ,
      child: MaterialButton(

  onPressed: () {
        onPress();

},
  child: Text(
      name,
      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),
  ),),
    );
Widget defaultTextButton(
{
required
Function
onPress
,
required
String
name
,
})=> TextButton(child: Text(name.toUpperCase()),onPressed: (){onPress();},);
void showToast({required String message,required ToastState state }){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:colorToast(state: state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastState{SUCCESS,ERROR,WARMING}
Color? colorToast({ required ToastState state}){
  Color color=Colors.green;
  switch(state){
    case ToastState.SUCCESS:
      color=color;
      break;
    case ToastState.ERROR:
      color=Colors.red;
      break;
    case ToastState.WARMING:
      color=Colors.amber;
      break;

  }
  return color;

}
Widget buildProductItem({product,context,bool isSearch=true}){


  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,


        children: [
          Container(
            height: 120,
            width: 120,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(image: NetworkImage('${product!.image}'),
                  width: 120,

                  height: 120,

                ),
                if(product.discount!=0&&isSearch)
                  Container(

                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child: Text('DISCOUNT',style: TextStyle(fontSize: 10,color: Colors.white))
                  )
              ],
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${product.name}',maxLines: 2,overflow: TextOverflow.ellipsis,),
                Spacer(),
                Row(

                  children: [
                    Text('${product.price}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.blue)),
                    SizedBox(width: 20,),
                    if(product.discount!=0&&isSearch)
                      Text('${product.oldPrice}',
                        style: TextStyle(color: Colors.grey,
                            decoration: TextDecoration.lineThrough),),
                    Spacer(),
                    IconButton(
                        padding: EdgeInsets.zero,

                        onPressed: (){
                          print(product.id);

                          ShopCubit.get(context).changeFavoriteShop(id: product.id!);


                        }
                        , icon:CircleAvatar(
                        backgroundColor:  ShopCubit.get(context).favorite[product.id]??false||product.in_favorite?Colors.blue:Colors.grey,
                        radius: 15,
                        child: Icon(Icons.favorite_border,color: Colors.white,)))
                  ],

                )
              ],),
          ),



        ],

      ),
    ),
  );
}