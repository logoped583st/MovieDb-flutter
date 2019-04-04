import 'ErrorMessage.dart';

class NotAuthorized extends Error implements ErrorMessage {
  @override
  String getErrorMessage(int errorCode) {
    return "User not authorized";
  }
}

class NotFound extends Error implements ErrorMessage {
  @override
  String getErrorMessage(int errorCode) {
    return "Not found";
  }
}

Error getError(int errorCode) {
  switch (ErrorCodes._internal(errorCode)) {
    case ErrorCodes.NOT_AUTHORIZED:
      return NotAuthorized();
    case ErrorCodes.INTERNAL_SERVER_ERROR:
      return Error();

    case ErrorCodes.NOT_FOUND:
      return NotFound();

    default:
      return Error();
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
