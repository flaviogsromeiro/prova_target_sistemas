import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tutorial_mobx/src/config/dependency_assembly.dart' as di;
import 'package:tutorial_mobx/src/modules/features/authentication/presentation/pages/webview_container.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';
import 'package:tutorial_mobx/src/modules/features/info/presentation/stores/info_store.dart';
import 'package:tutorial_mobx/src/modules/features/info/presentation/widgets/info_card_widget.dart';
import 'package:tutorial_mobx/src/modules/features/info/presentation/widgets/info_text_field_widget.dart';
import 'package:tutorial_mobx/src/widgets/dialogs/dialog_helper.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final infoStore = di.dependencyAssembly<InfoStore>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    infoStore.getAllInformationAction();
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.7,
                    width: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Observer(
                      builder: (_) => ListView.builder(
                        padding: const EdgeInsets.all(7),
                        itemCount: infoStore.informationsView.length,
                        itemBuilder: (context, index) {
                          return InfoCardWidget(
                              information: infoStore.informationsView[index],
                              onEdit: <String>(value) {
                                if (value != null) {
                                  final entity = Information(
                                      id: infoStore.informationsView[index].id,
                                      text: value.toString());

                                  infoStore.editInformationAaction(entity);
                                }
                              },
                              onDelete: () => DialogHelper.deleteDialog(
                                          context, 'Deseja excluir esse item ?')
                                      .then((value) {
                                    if (value) {
                                      infoStore.deleteInformationAction(
                                          infoStore.informationsView[index].id);
                                    }
                                  }));
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.4,
                  child: InfoTextFieldWidget(
                    onValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informa uma informação válida.';
                      }
                      return null;
                    },
                    onEditingPressed: () {
                      infoStore.createInformationAction(_controller.text);
                    },
                    hintText: 'Digite seu texto',
                    controller: _controller,
                  ),
                ),
                // Flexible(
                //   flex: 1,
                //   child: AppTextFieldWidget(
                //     labelText: '',
                //     validator: (p0) => null,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
