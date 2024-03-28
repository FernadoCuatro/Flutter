// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

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
    return ListView (
      children: _listarItems(),
    );
  }
  
  // Necesitamos que retorne una lista de Widget
  List<Widget> _listarItems() {
    return [
      ListTile( title: Text( 'Hola mundo' ) ),
      Divider(),
      ListTile( title: Text( 'Hola mundo' ) ),
      Divider(),
      ListTile( title: Text( 'Hola mundo' ) )
    ];
  }
}
