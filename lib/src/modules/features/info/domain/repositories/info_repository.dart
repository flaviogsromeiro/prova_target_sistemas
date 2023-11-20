import 'package:dartz/dartz.dart';
import 'package:tutorial_mobx/src/core/error/failures.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';

abstract class InfoRepository {
  Future<Either<Failure, List<Information>>> findAllCache();
  Future<Either<Failure, Information>> findCache(String id);
  Future<Either<Failure, Unit>> saveOrUpdateCache(Information entity);
  Future<Either<Failure, Unit>> deleteCache(String id);
}
