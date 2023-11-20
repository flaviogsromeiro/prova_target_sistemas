import 'package:tutorial_mobx/src/core/error/exceptions.dart';
import 'package:tutorial_mobx/src/core/error/failures.dart';

extension ParserExtensionBaseException on BaseException {
  Failure mapExceptionToFailure() {
    return LocalDatabaseErrorFailure();
  }
}
