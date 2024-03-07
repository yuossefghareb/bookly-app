
import 'package:dio/dio.dart';


abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errorMessage);
  // ignore: deprecated_member_use
  factory ServiceFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('Connrection Timeout ');
      case DioExceptionType.sendTimeout:
        return ServiceFailure('send Timeout ');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure('receive Timeout ');
      case DioExceptionType.badCertificate:
        return ServiceFailure('badCertificate  ');
      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServiceFailure('cancel error ');
      case DioExceptionType.connectionError:
        return ServiceFailure('connectionError  ');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServiceFailure('No Internet ');
        }
        return ServiceFailure('Unexpected Error ');
    }
  }
  factory ServiceFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServiceFailure('Your rquest not found,pls try later!');
    } else if (statusCode == 500) {
      return ServiceFailure('Internal server error,pls try later!');
    } else {
      return ServiceFailure('Opps there was an error');
    }
  }
}
