// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

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
        title: Text('Detalle pedido'),
      ),

      body: Container(
        child: Text(pedidoData!.idOrden),
      ),
    );
  }
}