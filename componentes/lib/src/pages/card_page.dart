// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),

      // Para las tarjetas
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _cardTipo1()
        ],
      ),

    );
  }
  
  Widget _cardTipo1() {
    
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue ),
            title: Text('Soy el titulo de la tarjeta'),
            subtitle: Text('La descripcion con el texto que requieren para ver como queda y que se pueda tener la cantidad correcta de texto y todo lo que tiene'),
          ),

          // Colocamos unos botones
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cancelar'),
                onPressed:() {},
              ),

              TextButton(
                child: Text('Siguiente'),
                onPressed:() {},
              )
            ],
          ),

        ],
      ), 
    );
  
  }
}