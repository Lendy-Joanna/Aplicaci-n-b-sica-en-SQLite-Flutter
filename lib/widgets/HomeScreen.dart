import 'package:flutter/material.dart';
import 'package:sqlite/widgets/CreateTodoButton.dart';
import 'package:sqlite/widgets/ReadTodoButton.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Alumnos interesados'),
      ),
      body:
      Column(
        children: <Widget>[
          Image(image: AssetImage('imagen/ut.png')),
          Image(
            image: AssetImage('imagen/form.png')),
          Center(
            heightFactor: 2.2,
            child: CreateTodoButton()),
          Center(child: ReadTodoButton())
        ],
      ),
    );
  }
}
