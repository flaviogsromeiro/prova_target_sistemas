import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:tutorial_mobx/src/core/domain/use_case.dart';
import 'package:tutorial_mobx/src/core/extensions/parser_extension_failure.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/usecases/info_find_all_use_case.dart';
import 'package:uuid/uuid.dart';

part 'info_store.g.dart';

class InfoStore = _InfoStore with _$InfoStore;

abstract class _InfoStore with Store {
  final UseCase<Unit, Information> create;
  final UseCase<Unit, String> delete;
  final UseCase<List<Information>, NoParams> getAll;
  final UseCase<Unit, Information> edit;

  _InfoStore({
    required this.create,
    required this.delete,
    required this.getAll,
    required this.edit,
  });

  @observable
  ObservableList<Information> informationsView = ObservableList<Information>();

  @observable
  bool isErrorCache = false;

  @observable
  String message = '';

  @observable
  bool isLoading = false;

  @action
  Future<void> createInformationAction(String text) async {
    var idGeneration = const Uuid();

    final result =
        await create.call(Information(id: idGeneration.v1(), text: text));

    result.fold((failure) {
      message = failure.mapFailureToMessage();
      isErrorCache = true;
    }, (_) {
      message = 'Informação adicionada com sucesso';
      isErrorCache = false;
    });

    getAllInformationAction();
  }

  @action
  Future<void> getAllInformationAction() async {
    final result = await getAll.call(NoParams());

    result.fold((failure) {
      message = failure.mapFailureToMessage();
      isErrorCache = true;
    }, (informations) {
      log('entrou');
      informationsView.clear();
      informationsView.addAll(informations.reversed);
      isErrorCache = false;
    });

    
  }

  @action
  Future<void> deleteInformationAction(String id) async {
    final result = await delete.call(id);

    result.fold((failure) {
      message = failure.mapFailureToMessage();
      isErrorCache = true;
    }, (_) {
      getAllInformationAction();
      isErrorCache = false;
    });
  }

  @action
  Future<void> editInformationAaction(Information entity) async {
    final result = await edit.call(entity);

    result.fold((failure) {
      message = failure.mapFailureToMessage();
      isErrorCache = true;
    }, (_) {
      message = '';
      isErrorCache = false;
    });
    getAllInformationAction();
  }
}
