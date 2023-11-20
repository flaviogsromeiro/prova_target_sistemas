// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfoStore on _InfoStore, Store {
  late final _$informationsViewAtom =
      Atom(name: '_InfoStore.informationsView', context: context);

  @override
  ObservableList<Information> get informationsView {
    _$informationsViewAtom.reportRead();
    return super.informationsView;
  }

  @override
  set informationsView(ObservableList<Information> value) {
    _$informationsViewAtom.reportWrite(value, super.informationsView, () {
      super.informationsView = value;
    });
  }

  late final _$isErrorCacheAtom =
      Atom(name: '_InfoStore.isErrorCache', context: context);

  @override
  bool get isErrorCache {
    _$isErrorCacheAtom.reportRead();
    return super.isErrorCache;
  }

  @override
  set isErrorCache(bool value) {
    _$isErrorCacheAtom.reportWrite(value, super.isErrorCache, () {
      super.isErrorCache = value;
    });
  }

  late final _$messageAtom = Atom(name: '_InfoStore.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_InfoStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$createInformationActionAsyncAction =
      AsyncAction('_InfoStore.createInformationAction', context: context);

  @override
  Future<void> createInformationAction(String text) {
    return _$createInformationActionAsyncAction
        .run(() => super.createInformationAction(text));
  }

  late final _$getAllInformationActionAsyncAction =
      AsyncAction('_InfoStore.getAllInformationAction', context: context);

  @override
  Future<void> getAllInformationAction() {
    return _$getAllInformationActionAsyncAction
        .run(() => super.getAllInformationAction());
  }

  late final _$deleteInformationActionAsyncAction =
      AsyncAction('_InfoStore.deleteInformationAction', context: context);

  @override
  Future<void> deleteInformationAction(String id) {
    return _$deleteInformationActionAsyncAction
        .run(() => super.deleteInformationAction(id));
  }

  late final _$editInformationAactionAsyncAction =
      AsyncAction('_InfoStore.editInformationAaction', context: context);

  @override
  Future<void> editInformationAaction(Information entity) {
    return _$editInformationAactionAsyncAction
        .run(() => super.editInformationAaction(entity));
  }

  @override
  String toString() {
    return '''
informationsView: ${informationsView},
isErrorCache: ${isErrorCache},
message: ${message},
isLoading: ${isLoading}
    ''';
  }
}
