// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';

// stless
// Con eso creamos nuestro StatelessWidget
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),

      body: _lista(),
    );
  }
  
  Widget _lista() {
    // Llamamos la clase
    // print( menuProvider.opciones );

    // Esto es un Future
    // menuProvider.cargarData()
    //   .then( (opciones) {
    //     print( opciones );
    //   } );

    // return ListView (
    //   children: _listarItems(),
    // );

    // Vamos a usar el Future Builder
    // El Future tiene tres estados 1. Cuando se hace una peticion 2. Cuando se resuelve 3. Cuando da un error
    return FutureBuilder(
      // future tiene que estar enlazado a lo que nosotros queremos esperar
      future: menuProvider.cargarData(),

      // Informacion por defecto miestra no se a resuelto el Future pero es opcional
      initialData: [],

      // builder Recibe una funcion que tiene como argumento el builder content y un AsyncSnapshot y retorna un Widget Builder
      // Significa que permite dibujarlo
      // builder: (  context, snapshot ) {
      builder: ( BuildContext context, AsyncSnapshot< List<dynamic> > snapshot ) {

        return ListView (
          children: _listarItems( snapshot.data ),
        );
        
      },
    );

  }
  
  // Necesitamos que retorne una lista de Widget
  List<Widget> _listarItems( data ) { // List<dynamic> data 
    // dibujamos la lista con los datos que estamos trayendo en la data
    final List<Widget> opciones = [];

    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach( (opcion) {
      final widgetTemp = ListTile(
        leading: Icon( Icons.access_alarms, color: Colors.blue, size: 35 ),
        title: Text( opcion['texto'] ),
        trailing: Icon( Icons.arrow_forward_ios_rounded, color: Colors.blue, size: 35 ),
        onTap: () {

        },
      );

      opciones..add(widgetTemp)
              ..add( Divider() );
    });

    return opciones;
  }
}