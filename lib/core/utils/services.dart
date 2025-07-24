// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl='https://www.themealdb.com/api/json/v1/1/';
  final Dio dio;
  ApiServices({
    required this.dio,
  });

Future<Map<String,dynamic>> get({required String endPoint})async{
   var response = await dio.get('$_baseUrl$endPoint');
   return response.data;
}
}
