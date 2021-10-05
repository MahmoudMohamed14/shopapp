 class ChangeFavorite{
 late bool status;
 late String message;
 ChangeFavorite.fromJson(Map<String,dynamic> json){
   status=json['status'];
   message=json['message'];
 }
}