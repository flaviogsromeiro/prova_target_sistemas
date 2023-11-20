/// Interface [BaseException] criada para implementação das exceptions
/// personalizadas.
abstract class BaseException implements Exception {
  BaseException();
}

/// Classe [LocalDatabaseException] para lançar exceção houver um
/// erro no Database local
class LocalDatabaseException extends BaseException {
  LocalDatabaseException();
}
