// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:tutorial_mobx/src/core/error/exceptions.dart';
import 'package:tutorial_mobx/src/core/error/failures.dart';
import 'package:tutorial_mobx/src/core/extensions/parser_extension_base_exception.dart';
import 'package:tutorial_mobx/src/modules/features/info/data/datasources/info_local_data_source.dart';
import 'package:tutorial_mobx/src/modules/features/info/data/models/information_model.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/repositories/info_repository.dart';

class InfoRepositoryImpl implements InfoRepository {
  final InfoLocalDataSource infoLocalDataSource;

  InfoRepositoryImpl({
    required this.infoLocalDataSource,
  });

  @override
  Future<Either<Failure, Unit>> deleteCache(String id) async {
    try {
      await infoLocalDataSource.deleteInformation(id);

      return const Right(unit);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }

  @override
  Future<Either<Failure, List<Information>>> findAllCache() async {
    try {
      final informations = await infoLocalDataSource.getAllInformation();

      return Right(informations);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }

  @override
  Future<Either<Failure, Information>> findCache(String id) async {
    try {
      final information = await infoLocalDataSource.getInformation(id);

      return Right(information);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveOrUpdateCache(Information entity) async {
    try {
      await infoLocalDataSource
          .saveOrUpdateInformation(InformationModel.fromEntity(entity));

      return const Right(unit);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }
}
