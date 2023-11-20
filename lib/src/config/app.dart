import 'package:flutter/material.dart';
import 'package:tutorial_mobx/src/modules/features/authentication/presentation/pages/authentication_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1e4e62)),
        useMaterial3: true,
      ),
      home: const AutenticationScreen(),
    );
  }
}
