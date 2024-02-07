// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


// una clase de toda la vida pero es un windget
class HomePage extends StatelessWidget {

  // estilo personalizado que haga el texto mas grande
  final estiloTexto = TextStyle( fontSize: 30 );

  @override
  Widget build( BuildContext context ) {
    // Scaffold, basicamente es algo que cubre toda la pantalla que se puede establecer cosas como la cosa de arriba, un boton un menu, etc 
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numero de clicks:', style: estiloTexto ),
            Text('0', style: estiloTexto ),
          ],
        ),
      ),
    );


  }

}