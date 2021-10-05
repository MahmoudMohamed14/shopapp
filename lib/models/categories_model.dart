class CategoriesModel{
  late bool states;
 late CategoriesData data;
 CategoriesModel.fromJson(Map<String,dynamic>json){
   states=json['status'];
   data=CategoriesData.fromJson(json['data']);
 }

}
class CategoriesData {
  int?current_page;
  List<DataModel>dataModel=[];

  CategoriesData.fromJson(Map<String, dynamic>json){

     current_page=json['current_page'];
     json['data'].forEach((element){
       dataModel.add(DataModel.fromJson(element));
     });

  }
}
class DataModel{
  int?id;
  String ?name;
  String ?image;
  DataModel.fromJson(Map<String,dynamic>json){
   id=json['id'];
   name=json['name'];
   image=json['image'];


  }
  }
  
