import 'package:flutter/material.dart';
import 'package:sqlite/model/Todo.dart';
import '../helper/DatabaseHelper.dart';

class DetailTodoScreen extends StatefulWidget {
  static const routeName = '/detailTodoScreen';
  final Todo todo;

  const DetailTodoScreen({Key key, this.todo}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateTodoState(todo);
}

class _CreateTodoState extends State<DetailTodoScreen> {
  Todo todo;
  final nombreController = TextEditingController(); //
  final carreraController = TextEditingController();
  final emailController = TextEditingController();
  final celularController = TextEditingController();
  final domicilioController = TextEditingController();
  final ciudadController = TextEditingController();

  _CreateTodoState(this.todo);
 String dropdownValue = 'Programacion';
  @override
  void initState() {
    super.initState();
    if (todo != null) {
      nombreController.text = todo.nombre; //
      carreraController.text = todo.carrera;
      emailController.text = todo.email;
      celularController.text = todo.celular;
      domicilioController.text = todo.domicilio;
      ciudadController.text = todo.ciudad;
      //dropdownValue = (todo.carrera.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();

    nombreController.dispose(); //
    carreraController.dispose();
    emailController.dispose();
    celularController.dispose();
    domicilioController.dispose();
    ciudadController.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion del Alumno'),
      ),
      body: ListView(
        children: [
          Image(image: AssetImage('imagen/f2.jpg')),
          Padding(
            //
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Nombre Completo"),
              maxLines: 1,
              controller: nombreController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  TextField(
                    controller: carreraController);
                });
              },
              items: <String>[
                'Programacion',
                'Derecho',
                'Administracion',
                'Mecatronica'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            //
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Correo Electronico"),
              maxLines: 1,
              controller: emailController,
            ),
          ),
          Padding(
            //
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Celular"),
              maxLines: 1,
              controller: celularController,
            ),
          ),
          Padding(
            //
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Domicilio "),
              maxLines: 1,
              controller: domicilioController,
            ),
          ),
          Padding(
            //
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Ciudad"),
              maxLines: 1,
              controller: ciudadController,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () async {
            _saveTodo(
                nombreController.text,
                carreraController.text,
                emailController.text,
                celularController.text,
                domicilioController.text,
                ciudadController.text); //
            setState(() {});
          }),
    );
  }

  _saveTodo(String nombre, String carrera, String email, String celular,
      String domicilio, String ciudad) async {
    //
    if (todo == null) {
      DatabaseHelper.instance.insertTodo(Todo(
          nombre: nombreController.text, //
          carrera: carreraController.text,
          email: emailController.text,
          celular: celularController.text,
          domicilio: domicilioController.text,
          ciudad: ciudadController.text));
      Navigator.pop(context, "Has sido registrado");
    } else {
      await DatabaseHelper.instance.updateTodo(Todo(
          id: todo.id,
          nombre: nombre,
          carrera: carrera,
          email: email,
          celular: celular,
          domicilio: domicilio,
          ciudad: ciudad
      )); //
      Navigator.pop(context);
    }
  }
}
