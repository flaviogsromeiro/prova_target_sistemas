import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tutorial_mobx/src/modules/features/authentication/presentation/pages/webview_container.dart';
import 'package:tutorial_mobx/src/modules/features/authentication/presentation/stores/authentication_store.dart';
import 'package:tutorial_mobx/src/modules/features/authentication/presentation/widgets/autentication_text_field_widget.dart';
import 'package:tutorial_mobx/src/modules/features/info/presentation/pages/info_screen.dart';
import 'package:tutorial_mobx/src/widgets/buttons/app_text_button.dart';

class AutenticationScreen extends StatefulWidget {
  const AutenticationScreen({super.key});

  @override
  State<AutenticationScreen> createState() => _AutenticationScreenState();
}

class _AutenticationScreenState extends State<AutenticationScreen> {
  AuthenticationStore autenticationStore = AuthenticationStore();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    autorun((_) {
      if (autenticationStore.isLogginIn) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return const InfoScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1e4e62), Color(0xff2d958e)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutenticationTextFieldWidget(
                          focusNode: focusNode2,
                          prefixIcon: Icons.person,
                          validator: autenticationStore.onValidatorUser,
                          labelText: 'Usuário',
                          onChanged: autenticationStore.setEmail,
                          isActiveSuffixAction: false,
                        ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        Observer(
                          builder: (_) => AutenticationTextFieldWidget(
                            isActiveSuffixAction: false,
                            focusNode: focusNode,
                            prefixIcon: Icons.lock,
                            onChanged: autenticationStore.setPassword,
                            validator: autenticationStore.onValidatorPassword,
                            labelText: 'Senha',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Observer(
                          builder: (_) {
                            return AppButtonWidget(
                              titleButton: 'Entrar',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  autenticationStore.signIn();
                                }
                              },
                              isLoading: autenticationStore.isLoading,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: TextButton(
                        style: const ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const WebViewContainer()));
                        },
                        child: const Text(
                          'Política de Privacidade',
                          style: TextStyle(
                              color: Color.fromARGB(255, 192, 192, 192)),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
