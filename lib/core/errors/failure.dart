import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

 const Failure({required this.errMessage});

}
class ServerFailure extends Failure{
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioError (DioException dioErr){
    switch(dioErr.type){
      
      case DioExceptionType.connectionTimeout:
       return ServerFailure(errMessage: 'Connection Timeout with Api services');
     
      case DioExceptionType.sendTimeout:
      return ServerFailure(errMessage: 'Send Timeout with Api services');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Recieve Timeout with Api services');
      case DioExceptionType.badCertificate:
         return ServerFailure(errMessage: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioErr.response!.statusCode, dioErr.response!.data);
      case DioExceptionType.cancel:
       return ServerFailure(errMessage: 'Request cancelled');
      case DioExceptionType.connectionError:
    return ServerFailure(errMessage: 'No internet Connection');
        default:
        return ServerFailure(errMessage: 'Opps There was an Error, Please try again');
     
    }

  }
factory ServerFailure.fromResponse(int? statusCode,dynamic response){
  if (statusCode==400||statusCode==402||statusCode==403){
    return ServerFailure(errMessage: 'there was a response erroe');

  }else if (statusCode==404){
    return ServerFailure(errMessage: 'Request not found ,try again later please');
  }else if (statusCode==500){
    return ServerFailure(errMessage: 'Internal Server error ,try again later please');
  }else {
    return ServerFailure(errMessage: 'OOPs there was an error');
  }

}
}