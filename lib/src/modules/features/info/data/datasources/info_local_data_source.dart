import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_mobx/src/core/error/exceptions.dart';
import 'package:tutorial_mobx/src/modules/features/info/data/models/information_model.dart';
import 'package:tutorial_mobx/src/utils/constants/shared_preferences_constants.dart';

abstract class InfoLocalDataSource {
  Future<Unit> cacheInformations(List<InformationModel> informations);
  Future<Unit> saveOrUpdateInformation(InformationModel model);
  Future<Unit> deleteInformation(String id);
  Future<List<InformationModel>> getAllInformation();
  Future<InformationModel> getInformation(String id);
}

class InfoLocalDataSourceImpl implements InfoLocalDataSource {
  final SharedPreferences sharedPreferences;

  InfoLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<Unit> cacheInformations(List<InformationModel> informations) async {
    final informationsMap =
        informations.map((category) => category.toMap()).toList();

    final informationsJson = jsonEncode(informationsMap);

    final cacheResult = await sharedPreferences.setString(
      SharedPreferencesConstants.kInformationsKey,
      informationsJson,
    );

    if (cacheResult == true) {
      return Future.value(unit);
    }

    throw LocalDatabaseException();
  }

  @override
  Future<Unit> saveOrUpdateInformation(InformationModel model) async {
    try {
      final informations = await getAllInformation();

      final isContainsModel = informations
          .any((cacheInformation) => model.id == cacheInformation.id);

      if (isContainsModel) {
        informations
          ..removeWhere((cacheInformation) => model.id == cacheInformation.id)
          ..add(model);
      } else {
        informations.add(model);
      }

      return cacheInformations(informations);
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<List<InformationModel>> getAllInformation() async {
    try {
      final informationsJson = sharedPreferences
          .getString(SharedPreferencesConstants.kInformationsKey);

      if (informationsJson != null) {
        final informationsMap = jsonDecode(informationsJson) as List;
        final categories = List.generate(
          informationsMap.length,
          (index) => InformationModel.fromMap(
            informationsMap[index] as Map<String, dynamic>,
          ),
        );

        return Future.value(categories);
      }
      return Future.value([]);
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<Unit> deleteInformation(String id) async {
    try {
      final informations = await getAllInformation();

      if (informations.any((information) => information.id == id)) {
        informations.removeWhere((information) => information.id == id);

        return cacheInformations(informations);
      }

      throw LocalDatabaseException();
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<InformationModel> getInformation(String id) async {
    try {
      final informations = await getAllInformation();

      final infomation = informations.firstWhere(
        (category) => category.id == id,
        orElse: () => throw LocalDatabaseException(),
      );

      return infomation;
    } on BaseException {
      rethrow;
    }
  }
}
