import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio=Dio(
         BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,

    )
    );

  }
  static Future<Response> get({
    required String pass,query,
    String lang='en',
    String?token

  })async{
    dio.options.headers={
      'lang':'$lang',
      'Content-Type':'application/json',

      'Authorization':'$token'

    };
    return await dio.get('${pass}',queryParameters: query);

  }
  static Future<Response> postData({
    required String pass
    ,Map<String,dynamic>? query
    , required Map<String,dynamic> data,
    String lang='en',
    String?token

  })async{
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':'$lang',
      'Authorization':'$token'


    };
    return await dio.post(pass,queryParameters: query,data:data );

  }
  static Future<Response> putData({
    required String pass
    ,Map<String,dynamic>? query
    , required Map<String,dynamic> data,
    String lang='en',
    String?token

  })async{
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':'$lang',
      'Authorization':'$token'


    };
    return await dio.put(pass,queryParameters: query,data:data );

  }

}