// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InfoTextFieldWidget extends StatefulWidget {
  const InfoTextFieldWidget({
    Key? key,
    required this.onEditingPressed,
    required this.onValidator,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final VoidCallback onEditingPressed;
  final String? Function(String?) onValidator;
  final TextEditingController controller;
  final String hintText;

  @override
  State<InfoTextFieldWidget> createState() => _InfoTextFieldWidgetState();
}

class _InfoTextFieldWidgetState extends State<InfoTextFieldWidget> {
  FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        focusNode: focusNode,
        autofocus: true,
        textAlign: TextAlign.center,
        onEditingComplete: () {
          if (_formKey.currentState!.validate()) {
            widget.onEditingPressed();
            widget.controller.clear();
          }
        },
        controller: widget.controller,
        validator: widget.onValidator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: const Color(0xffffffff),
          contentPadding: const EdgeInsets.all(0),
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            // fontWeight: FontWeight.normal,
            // fontSize: 18,
          ),
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
    );
  }
}
