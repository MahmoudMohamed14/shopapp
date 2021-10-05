import 'package:shared_preferences/shared_preferences.dart';

class CachHelper{
  static late SharedPreferences sharedPreferences;
  static init()async{
    sharedPreferences= await SharedPreferences.getInstance() ;
  }
 static  Future<bool> putData ({
   required String key,
    required dynamic value
})async{
    if(value is bool)
   return await sharedPreferences.setBool(key, value);
    if(value is String)
      return  await sharedPreferences.setString(key, value);
    if(value is double)
      return  await sharedPreferences.setDouble(key, value);
    return  await sharedPreferences.setInt(key, value);

  }

static bool? getBoolean({
  required String key
}){
    return sharedPreferences.getBool(key);
  }
  static String? getString({
    required String key
  }){
    return sharedPreferences.getString(key);
  }
  static int? getInteger({
    required String key
  }){
    return sharedPreferences.getInt(key);
  }
  static double? getDouble({
    required String key
  }){
    return sharedPreferences.getDouble(key);
  }
 static Future<bool> removeData({
    required String key
  })async{
   return await sharedPreferences.remove(key);
  }

}