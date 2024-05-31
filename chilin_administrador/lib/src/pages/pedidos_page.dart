// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_function_literals_in_foreach_calls, unused_local_variable

import 'package:chilin_administrador/src/models/pedido_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PedidosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Filtro para mostrar los pedidos
    String filtro = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
          title: Text('Pedidos $filtro'),
          actions: filtro == 'pending' ? [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () => Navigator.pushNamed(context, 'pedidos', arguments: 'finished'),

              
              child: Text(
                'Pedidos finalizados',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(width: 5),

            IconButton(
              onPressed: () => Navigator.pushNamed(context, 'pedidos', arguments: 'canceled'),
              icon: Icon(Icons.cancel_outlined),
              style: IconButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),

            SizedBox(width: 10),
          ]  : [],
        ),

      body: _crearListado( filtro ),
    );
  }

  // Funcion para ejecutar los diferentes registros dentros de las colecciones y documentos
  Widget _crearListado(String filtro) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Usuarios').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          final usuarios = snapshot.data!.docs;
          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final usuarioDoc = usuarios[index];

              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Usuarios').doc(usuarioDoc.id)
                .collection('Ordenes').where('estado', isEqualTo: 'OrderStatus.$filtro').snapshots(),

                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> ordenesSnapshot) {
                  if (ordenesSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (ordenesSnapshot.hasError) {
                    return Center(child: Text('Error: ${ordenesSnapshot.error}'));
                  }
                  if (ordenesSnapshot.hasData) {
                    final ordenes = ordenesSnapshot.data!.docs;
                    final pedidos = ordenes.map((orden) => PedidoModel(
                      idCliente : usuarioDoc.id,
                      nombre    : usuarioDoc['nombre'],
                      apellido  : usuarioDoc['apellido'],
                      fotoPerfil: usuarioDoc['fotoPerfil'],
                      telefono  : usuarioDoc['numeroTelefono'],
                      email     : usuarioDoc['email'],
                      username  : usuarioDoc['username'],
                      idOrden   : orden.id,
                      fechaOrden: orden['fechaOrden'],
                      metodoPago: orden['metodoPago'],
                      montoTotal: orden['montoTotal'],
                      estado    : orden['estado'],
                    )).toList();
                    
                    return Column(
                      children: pedidos.map((pedido) => _crearItem(context, pedido, filtro)).toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(context, PedidoModel pedido, filtro) {
    // Color por defecto para los iconos
    Color iconColor = Colors.red;

    // Validacion segun filtro
    switch (filtro) {
      case 'pending':
        iconColor = Colors.red;
        break;
      case 'canceled':
        iconColor = Colors.black;
        break;
      case 'finished':
        iconColor = Colors.green;
        break;
    }

    return Card(
      elevation: 4.0,
      margin: EdgeInsets.only(left: 30, bottom: 20, right: 30),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, 'pedido', arguments: pedido);
        },
        title: Container(
          padding: EdgeInsets.all(0),
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  pedido.fotoPerfil.isEmpty
                      ? Icon(Icons.account_circle_sharp, size: 30)
                      : CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(pedido.fotoPerfil),
                        ),
                  SizedBox(width: 5),
                  Text(
                    '${pedido.nombre.toUpperCase()} ${pedido.apellido.toUpperCase()}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Metodo de pago: ${pedido.metodoPago}'),
                        Row(
                          children: [
                            Text('Estado del pedido: $filtro '),
                            Icon(Icons.circle_rounded, size: 25.0, color: iconColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${pedido.montoTotal.toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}