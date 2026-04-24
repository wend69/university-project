import 'package:flutter/material.dart'; 
import 'package:ok/pages/index.dart';
import 'package:ok/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ok',
      theme: MainTheme().appTheme,
      home: HomePage(),
    );
  }
}
