import 'package:http/http.dart';

import '../errors/http_exception.dart';

extension ResponseParsing on Response {
  void handleResponse(String httpMethod) {
    if (statusCode < 200 || statusCode >= 300) {
      throw HttpException(
        code: statusCode,
        httpMethod: httpMethod,
        header: headers.toString(),
        body: body,
      );
    }
  }
}
