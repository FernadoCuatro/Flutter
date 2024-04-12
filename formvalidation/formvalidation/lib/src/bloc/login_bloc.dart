// Creamos los string para controlar el correo y la contraseña
import 'dart:async';

class LoginBloc {
  // Dos controladores, email y password y privados
  final _emailController    = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // Ocupamos una forma para poder escuchar el string
  // Recuperar los datos del Strem
  Stream<String> get emailStrem    => _emailController.stream;
  Stream<String> get passwordStrem => _passwordController.stream;
  
  // Getter y Setter
  // Insertar valores al string
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Cerramos cuando ya no necesitemos
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
