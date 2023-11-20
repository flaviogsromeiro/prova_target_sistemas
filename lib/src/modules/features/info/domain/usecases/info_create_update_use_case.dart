// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tutorial_mobx/src/core/domain/use_case.dart';
import 'package:tutorial_mobx/src/core/error/failures.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/repositories/info_repository.dart';

class InfoCreateOrUpdateUseCase implements UseCase<Unit, Information> {
  final InfoRepository repository;
  InfoCreateOrUpdateUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call(Information params) async {
    return repository.saveOrUpdateCache(params);
  }
}
