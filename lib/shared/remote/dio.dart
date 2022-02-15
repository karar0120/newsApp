
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
class DioHelper{
  static Dio? dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl:"https://newsapi.org/",
        receiveDataWhenStatusError: true,
      )
    );
  }
 static Future<Response> getdate({
  required String url,
  required Map <String ,dynamic>Quires,
})async{
    return await dio!.get(
        url,
        queryParameters:Quires );
  }

}
//https://newsapi.org/v2/top-headlines?country=eg&apiKey=5d7709efd89f43389f692a07a9a3be1a