class FavoritesDataModel {
  late bool status;

 late DataModel dataModel;

  FavoritesDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    dataModel =  new DataModel.fromJson(json['data']);
  }


}

class DataModel {

  List<Data>? data=[];




  DataModel.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {

      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }

  }


}

class Data {
  int ?id;
  Product ?product;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
  }


}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  bool ?in_favorite;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    in_favorite=json['in_favorite'];
  }


}