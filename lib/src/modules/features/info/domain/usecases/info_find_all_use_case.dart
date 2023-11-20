import 'package:dartz/dartz.dart';
import 'package:tutorial_mobx/src/core/domain/use_case.dart';
import 'package:tutorial_mobx/src/core/error/failures.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/repositories/info_repository.dart';

class InfoFindAllUseCase implements UseCase<List<Information>, NoParams> {
  final InfoRepository repository;
  InfoFindAllUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Information>>> call(NoParams noParams) async {
    return repository.findAllCache();
  }
}

class NoParams {
  NoParams();
}
