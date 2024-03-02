// crearemos el StatefulWidget
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// tenemos que extender
class contadorPage extends StatefulWidget {
  // tenemos que implementar si o si sobreescribiendo
  @override
  State<StatefulWidget> createState() {
    // retorna una instancia de estado
    return _contadorPageState();
  }
  // como lo anterior es una linea, tambien podemos decirle que sea una funcion de flecha
  // createState() => _contadorPageState();
}

// tambien el estado
class _contadorPageState extends State<contadorPage> {
  // solo se utiliza de la clase anterior
  // con el _ antes del nombre lo hacemos privado
  // tenemos que especificarle al State que tipo de estado tiene que manejar <>
  
  // estilo personalizado que haga el texto mas grande
  final _estiloTexto = TextStyle( fontSize: 30 );

  // la variable para contar
  int _conteo = 0;

  @override
  Widget build( BuildContext context ) {
    // Scaffold, basicamente es algo que cubre toda la pantalla que se puede establecer cosas como la cosa de arriba, un boton un menu, etc 
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de clicks:', style: _estiloTexto ),
            Text( '$_conteo' , style: _estiloTexto ), // interpolacion de string con el $
          ],
        ),
      ),

      // para cambiar la posicion del boton
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // para agregar un boton en HD
      floatingActionButton: FloatingActionButton(
        // si lo mandas el onPressed en null es como que el boton esta desabilitado
        onPressed: () { // () {} es una funcion anonima
          // print('Hola mundo'); para salida en consola
          _conteo++;

          // necesitamos que se redibuje el numerrin, es decir el statefulwidget
          // se podria mover el conteo dentro, pero es igual 
          setState(() { });
        } , 

        // tambien tenemos el hijo
        child: Icon( Icons.add ), // se puede mostrar un texto tranquilamente Text('+')
      ),
    );
  }
}

 