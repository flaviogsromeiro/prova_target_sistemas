import 'package:dartz/dartz.dart';
import 'package:tutorial_mobx/src/core/domain/use_case.dart';
import 'package:tutorial_mobx/src/core/error/failures.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/repositories/info_repository.dart';

class InfoDeleteUseCase implements UseCase<Unit, String> {
  final InfoRepository repository;
  InfoDeleteUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call(String id) async {
    return repository.deleteCache(id);
  }
}