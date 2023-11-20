import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  AppButtonWidget({
    required this.titleButton,
    super.key,
    this.isLoading = false,
    required this.onPressed,
  });

  final String titleButton;
  bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff44bd6e),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? _isLoading()
            : Text(
                titleButton,
                style: const TextStyle(color: Color(0xffffffff), fontSize: 18),
              ),
      ),
    );
  }

  Widget _isLoading() {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: Color(0xffffffff),
      ),
    );
  }
}
