import 'package:flutter/material.dart';


// una clase de toda la vida pero es un windget
class HomePage extends StatelessWidget {

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
        child: Text('Hola mundo'),
      ),
    );


  }

}