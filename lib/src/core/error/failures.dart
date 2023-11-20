import 'package:equatable/equatable.dart';

/// Classe Abstrata Base [Failure] para ser implementada.
abstract class Failure implements Equatable {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

/// Classe [LocalDatabaseErrorFailure] referente as exceções relacionadas ao
/// Storage do usuário.
class LocalDatabaseErrorFailure extends Failure {
  LocalDatabaseErrorFailure();
}
