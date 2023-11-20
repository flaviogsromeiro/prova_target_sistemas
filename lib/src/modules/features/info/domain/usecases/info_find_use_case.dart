import 'package:dartz/dartz.dart';
import 'package:tutorial_mobx/src/core/domain/use_case.dart';
import 'package:tutorial_mobx/src/core/error/failures.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/repositories/info_repository.dart';

class InfoFindUseCase implements UseCase<Information, String> {
  final InfoRepository repository;
  InfoFindUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Information>> call(String id) async {
    return repository.findCache(id);
  }
}
