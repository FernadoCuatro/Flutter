// los imports
import 'package:flutter/material.dart';

// punto inicial
void main() {
    // la que se usa siempre y espera un Windget
    runApp( MyApp() );


}

// todos los windget son clases comunes y corrientes
class MyApp extends StatelessWidget {
  // sobreescribimos el metodo build 
  // el context contiene la informacion del arbol de windget
  @override
  Widget build( context ) {
    // permite la configuracion global de la app
    return MaterialApp(
      home: Center(
        child: Text('Hola mundo'),
      ), 
    );
  }
 



}