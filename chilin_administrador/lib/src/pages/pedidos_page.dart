// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:chilin_administrador/src/models/pedido_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PedidosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos pendientes'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () { },
            child: Text(
              'Pedidos finalizados',
              style: TextStyle(
                // Color del texto
                color: Colors.white, 
                // Estilo del texto (negrita)
                fontWeight: FontWeight.bold, 
                // Tamaño del texto
                fontSize: 14, 
              ),
            ),
          ),

          SizedBox(width: 10)
        ],
      ),


      body: Text('Vamos aqui'),
    );
  }
}