// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tutorial_mobx/src/modules/features/info/domain/entities/information.dart';
import 'package:tutorial_mobx/src/widgets/dialogs/dialog_helper.dart';

class InfoCardWidget extends StatefulWidget {
  const InfoCardWidget({
    Key? key,
    required this.information,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  final Information information;
  final VoidCallback onDelete;
  final void Function<T>(T?) onEdit;

  @override
  State<InfoCardWidget> createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    widget.information.text,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                  )),
            ),
            IconButton(
              onPressed: () =>
                  DialogHelper.textFieldDialog(context, widget.information.text)
                      .then(widget.onEdit),
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.zero,
                ),
              ),
              icon: const Icon(
                Icons.border_color,
                size: 35,
              ),
            ),
            IconButton(
                onPressed: widget.onDelete,
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.zero,
                  ),
                ),
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 40,
                ))
          ],
        ),
      ),
    );
  }

  Widget loadWidget() {
    return const CircularProgressIndicator(
      color: Colors.red,
    );
  }
}
