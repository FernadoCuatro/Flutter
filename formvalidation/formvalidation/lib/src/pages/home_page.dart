// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // La clase creada anteriormente
    // Tenemos acceso a todos los metodos y propiedades que estan definidos en el bloc
    final bloc = Provider.of( context );

    return Scaffold(
      appBar:AppBar(
        // Obteniendo la informacion del bloc aqui tambien
        title: Text('Inicio')
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: ${ bloc?.email } '),
            Divider(),
            Text('Password: ${ bloc?.password }')
          ],
        ),
    );
  }
}