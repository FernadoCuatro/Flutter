// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:chilin_administrador/src/models/pedido_model.dart';
import 'package:flutter/material.dart';

class PedidoPage extends StatefulWidget {
  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  @override
  Widget build(BuildContext context) {
    // De esta manera estoy tomando el argumento si viene
    final PedidoModel? pedidoData = ModalRoute.of(context)?.settings.arguments as PedidoModel?;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),

      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Image.asset(
              'assets/chilin.png',
              fit: BoxFit.contain,
            ),
          ),

          // Encabezado del pedido
          Container(
            height: 150,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: pedidoData!.fotoPerfil.isNotEmpty 
                    ? ClipOval(
                        child: Container(
                          color: Colors.grey[200], // Fondo color gris claro
                          child: Image.network(
                            pedidoData.fotoPerfil,
                            fit: BoxFit.contain, // Ajusta la imagen para cubrir todo el contenedor
                          ),
                        )
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[200], 
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.grey,
                        ),
                      ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${pedidoData.nombre.toUpperCase()} ${pedidoData.apellido.toUpperCase()}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                        Container(
                          margin: EdgeInsets.only(top: 3.0), 
                          child: Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 8.0),
                              Text(pedidoData.telefono, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.green)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.0), 
                          child: Row(
                            children: [
                              Icon(Icons.email_outlined),
                              SizedBox(width: 8.0),
                              Text(pedidoData.email, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.0), 
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 8.0),
                              Text(pedidoData.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          )















        ],
      ),
    );
  }
}