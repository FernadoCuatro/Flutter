// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
// import 'package:formvalidation/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // La clase creada anteriormente
    // Tenemos acceso a todos los metodos y propiedades que estan definidos en el bloc
    // final bloc = Provider.of( context );

    return Scaffold(
      appBar:AppBar(
        // Obteniendo la informacion del bloc aqui tambien
        title: Text('Inicio')
      ),

      // Text('Email: ${ bloc?.email } '),
      // Divider(),
      // Text('Password: ${ bloc?.password }')

      body: Container(),

      // Boto para crear un nuevo producto
      floatingActionButton: _crearBoton( context ),
    );
  }
  
  _crearBoton( context ) {
    return FloatingActionButton(
      child: Icon( Icons.add ),
      // Cambiamos el color a la aplicacion
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}