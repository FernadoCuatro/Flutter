import 'package:flutter/material.dart';

// Creamos un StatelessWidget
class HomePageTemp extends StatelessWidget {

  // El ListView es como cuando queires que haga scroll en la vista 
  // Como la aplicacion de contactos que se puede hacer scroll con los elementos

  // El ListView esta bien cuando son elementos pocos
  // Pero si son muchos elementos el optimo es el ListView.builder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes Temp'),
      ),

      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('ListTile Title'),
          ),

          Divider(),

          ListTile(
            title: Text('ListTile Title'),
          ),


          ListTile(
            title: Text('ListTile Title'),
          ),









        ],
      ),

    );
  }
}