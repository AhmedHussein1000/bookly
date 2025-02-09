abstract class BaseException implements Exception {
  final String message;
  const BaseException(this.message);
}

class ServerException extends BaseException {
  const ServerException(super.message);
}

class DioNetworkException extends BaseException {
  const DioNetworkException(super.message);
}
