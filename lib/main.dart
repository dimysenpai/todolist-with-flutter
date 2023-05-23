import 'package:flutter/material.dart';
import 'package:todolist/screens/home_screen.dart';

import 'package:json_theme/json_theme.dart';

import 'package:flutter/services.dart';
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/theme.json');

  final themeJson = jsonDecode(themeStr);

  final theme = ThemeDecoder.decodeThemeData(themeJson);

  runApp(App(
    theme: theme!,
  ));
}

class App extends StatelessWidget {
  final ThemeData theme;

  const App({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoList',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
