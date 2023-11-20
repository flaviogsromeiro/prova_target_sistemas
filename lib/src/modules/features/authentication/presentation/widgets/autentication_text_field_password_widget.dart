// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AutenticationTextFieldPasswordWidget extends StatefulWidget {
  const AutenticationTextFieldPasswordWidget({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    required this.isActiveSuffixAction,
    this.suffixAction,
    required this.labelText,
    required this.validator,
    this.onChanged,
    required this.focusNode,
  }) : super(key: key);

  /// PrefixIcon do campo (opcional);
  final IconData? prefixIcon;

  /// SuffixIcon do campo (opcional);
  final IconData? suffixIcon;

  /// Booleano para exibir o SuffixIcon do campo;
  final bool isActiveSuffixAction;

  /// Callback para o suffixIconButton do campo;
  final VoidCallback? suffixAction;

  /// Título do campo;
  final String labelText;

  /// Função que valida o campo;
  final String? Function(String?) validator;

  /// Função que escuta os dados inseridos e faz uma reação;
  final void Function(String?)? onChanged;

  /// FocusNode do campo
  final FocusNode focusNode;

  @override
  State<AutenticationTextFieldPasswordWidget> createState() =>
      _AutenticationTextFieldPasswordWidgetState();
}

class _AutenticationTextFieldPasswordWidgetState
    extends State<AutenticationTextFieldPasswordWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 5),
            child: Text(
              widget.labelText,
              style: const TextStyle(color: Color(0xffffffff), fontSize: 15),
            ),
          ),
          SizedBox(
            height: 70,
            child: TextFormField(
              focusNode: widget.focusNode,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffffffff),
                contentPadding: const EdgeInsets.all(10),
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
                prefixIcon: Icon(
                  widget.prefixIcon,
                  color: Colors.black,
                ),
                suffixIcon: widget.isActiveSuffixAction
                    ? IconButton(
                        onPressed: widget.suffixAction,
                        icon: Icon(widget.suffixIcon),)
                    : null,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
