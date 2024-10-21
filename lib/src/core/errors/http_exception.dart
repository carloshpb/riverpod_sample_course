import 'app_exception.dart';

class HttpException extends AppException {
  HttpException({
    super.code,
    required this.httpMethod,
    required this.header,
    required this.body,
  }) : super(
            'HTTP $httpMethod request failed with status: $code \nheader:$header \nbody: $body');

  final String httpMethod;
  final String header;
  final String body;
}
