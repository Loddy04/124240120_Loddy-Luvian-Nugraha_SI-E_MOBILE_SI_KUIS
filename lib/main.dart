import 'package:flutter/material.dart';
import 'screens/root_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Alat Tulis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 42, 29, 232), useMaterial3: true),
      home: const RootScreen(),
    );
  }
}
