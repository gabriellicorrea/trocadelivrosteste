import 'package:flutter/material.dart';
import 'package:trocadelivros2/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Login(),
    );
  }
}
