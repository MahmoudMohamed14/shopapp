class SearchModel{
 late bool status;
Data? data;
 SearchModel.fromJson(Map<String,dynamic> json){
status=json['status'];
  data=Data.fromJson(json['data']);
 }

}
class Data{
  List<Product> product=[];
  Data.fromJson(Map<String,dynamic> json){
    json['data'].forEach((element){
      product.add(Product.fromJson(element)) ;
    });
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
  bool? in_favorite;
  bool? in_cart;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    in_favorite=json['in_favorites'];
    in_cart=json['in_cart'];
  }


}