import 'dart:math';

class HomeModel{
 late bool status;
 late HomeDataModel homeDataModel;
 HomeModel.fromJson(Map<String,dynamic> json){
   status=json['status'];
   homeDataModel=HomeDataModel.fromJson(json['data']);

 }

}
class HomeDataModel{


  List<BannersData >?banners=[];
  List<ProductsData >?products=[];
  HomeDataModel.fromJson(Map<String,dynamic> json){

  json['banners'].forEach(( element){

     banners!.add(BannersData.fromJson(element));

 });
  json['products'].forEach((element){

    products!.add(ProductsData.fromJson(element));
 });

  }
}

class BannersData{
  int ?id;
  String?image;
  BannersData.fromJson(dynamic json){
    id=json['id'];
    image=json['image'];


  }
}
class ProductsData{

  dynamic price;
  dynamic oldPrice;
  int? discount;
  int?id;
  String ?name;
  String ?image;
  bool? in_favorite;
  bool? in_cart;


  ProductsData.fromJson(dynamic json){
     id=json['id'];
     price=json['price'];
     oldPrice =json['old_price'];
     discount=json['discount'];
     name=json['name'];
     image=json['image'];
     in_favorite=json['in_favorites'];
     in_cart=json['in_cart'];



  }
}