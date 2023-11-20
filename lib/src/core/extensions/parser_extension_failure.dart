import 'package:tutorial_mobx/src/core/error/failures.dart';

extension FailureUtils on Failure {
  String mapFailureToMessage() {
    return 'Erro ao executar uma ação no banco de dados';
  }
}
