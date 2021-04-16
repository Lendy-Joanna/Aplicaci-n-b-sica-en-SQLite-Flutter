class Todo {
  final int id;
  final String nombre;
  final String carrera;
  final String email;
  final String celular;
  final String domicilio;
  final String ciudad;
  static const String TABLENAME = "todos";

  Todo({this.id, this.nombre, this.carrera, this.email, this.celular, this.ciudad, this.domicilio});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'carrera': carrera,
      'email': email,
      'celular': celular,
      'domicilio': domicilio,
      'ciudad': ciudad
    };
  }
}
