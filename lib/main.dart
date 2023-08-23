import 'package:flutter/material.dart';
import 'package:web/imc_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo para cálculo de IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),
      home: const ImcPage(title: 'Calculadora de IMC do Luan Fonseca'),
    );
  }
}
