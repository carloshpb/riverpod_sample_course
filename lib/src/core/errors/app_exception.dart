abstract class AppException implements Exception {
  final String message;
  final int? code;

  AppException(this.message, {this.code});

  @override
  String toString() {
    final printMessage = '$runtimeType: $message';
    if (code != null) {
      return '$printMessage (code: $code)';
    }
    return printMessage;
  }
}
