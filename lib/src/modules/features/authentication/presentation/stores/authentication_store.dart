import 'package:mobx/mobx.dart';

part 'authentication_store.g.dart';

class AuthenticationStore = _AuthenticationStore with _$AuthenticationStore;

abstract class _AuthenticationStore with Store {
  @observable
  String user = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool isLogginIn = false;

  @action
  void setEmail(String? value) =>
      user = value != null ? value.substring(0, value.length - 1) : '';

  @action
  void setPassword(String? value) =>
      password = value != null ? value.substring(0, value.length - 1) : '';

  @action
  String? onValidatorUser(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório.';
    } else if (value.length > 20) {
      return "Limite de 20 caracteres excedido.";
    }
    return null;
  }

  @action
  String? onValidatorPassword(String? value) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');

    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório.';
    } else if (value.length > 20) {
      return "Limite de 20 caracteres excedido.";
    } else if (!regex.hasMatch(value)) {
      return 'Não é permitido inserir caracteres especiais.';
    } else if (value.length <= 2) {
      return 'Deve conter pelo menos 3 caracteres alfanuméricos.';
    }
    return null;
  }

  @action
  Future<void> signIn() async {
    isLoading = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    isLogginIn = true;
  }
}
