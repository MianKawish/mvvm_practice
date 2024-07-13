class AppExceptions implements Exception {
  final String? _message;
  final String? _prefix;
  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super(message, 'No internet');
}

class RequestTimeout extends AppExceptions {
  RequestTimeout([String? message]) : super(message, 'Request timeout');
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'Internal Server error');
}

class InvalidUrl extends AppExceptions {
  InvalidUrl([String? message]) : super(message, 'Invalid URL');
}
