import 'package:flutter/material.dart';
import 'package:tutorial_mobx/src/config/app.dart';
import 'package:tutorial_mobx/src/config/dependency_assembly.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.setupDependencyAssemblies();

  runApp(const App());
}
