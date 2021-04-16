import 'package:flutter/material.dart';

import '../screens/ReadTodoScreen.dart';

class ReadTodoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      
      onPressed: () {
        _navigateToReadTodoScreen(context);
      },
      child: Text("Ver Alumnos Registrados"),
      color: Colors.yellow,
      
      
      
    );
  }

  _navigateToReadTodoScreen(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadTodoScreen()),
    );
  }
}