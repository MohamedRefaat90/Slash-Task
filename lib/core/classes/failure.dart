import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  Failure({required this.errMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMsg});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMsg: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMsg: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMsg: 'Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.connectionError:
        return ServerFailure(errMsg: 'Connection Error with ApiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMsg: 'No Internet Connection');
        }
        return ServerFailure(errMsg: 'Unexpected Error, Please try again!');
      default:
        return ServerFailure(
            errMsg: 'Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMsg: response['error']['message']);
    } else if (statusCode == 500) {
      return ServerFailure(errMsg: "Internal Server Error, try Again Later");
    } else if (statusCode == 404) {
      return ServerFailure(errMsg: "Your Requeset Not Found");
    } else {
      return ServerFailure(errMsg: "There Something Wrong");
    }
  }
}
