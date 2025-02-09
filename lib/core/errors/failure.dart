import 'package:dio/dio.dart';

abstract class Failure {
 const Failure(this.errormsg);
  final String errormsg;
}
class ServerFailure extends Failure{
 const ServerFailure(super.errormsg);
  factory ServerFailure.fromDioException({required DioException dioException}){
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with api server');

      case DioExceptionType.connectionError:
        return const ServerFailure('No Internet Connection');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad Certificate with api server');
      case DioExceptionType.cancel:
        return const ServerFailure('Request to Api Server was canceled');
      case DioExceptionType.unknown:
        return const ServerFailure('There was an Error, Please try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromStatusCode(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
    }
  }
  factory ServerFailure.fromStatusCode(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response['error']['message'] == 'Missing query.') {
        return const ServerFailure('No Results');
      }
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return const ServerFailure('Your request is not found');
    } else if (statusCode == 500) {
      return const ServerFailure('Internal server error, please try again later');
    } else if (statusCode == 429) {
      return const ServerFailure('too many requests');
    } else {
      return const ServerFailure('There was an error ,please try again later');
    }
  }

  }
   


