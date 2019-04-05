import 'ErrorMessage.dart';

class NotAuthorized implements Exception, ErrorMessage {
  @override
  String getErrorMessage(int errorCode) {
    return "User not authorized";
  }
}

class NotFound implements Exception, ErrorMessage {
  @override
  String getErrorMessage(int errorCode) {
    return "Not found";
  }
}

Exception getError(int errorCode) {
  switch (ErrorCodes._internal(errorCode)) {
    case ErrorCodes.NOT_AUTHORIZED:
      return NotAuthorized();
    case ErrorCodes.INTERNAL_SERVER_ERROR:
      return Exception();

    case ErrorCodes.NOT_FOUND:
      return NotFound();

    default:
      return Exception();
  }
}

class ErrorCodes {
  final int _errorCode;

  const ErrorCodes._internal(this._errorCode);

  toString() => 'ErrorCdode.$_errorCode';

  static const NOT_FOUND = const ErrorCodes._internal(404);
  static const NOT_AUTHORIZED = const ErrorCodes._internal(401);
  static const INTERNAL_SERVER_ERROR = const ErrorCodes._internal(500);
}
