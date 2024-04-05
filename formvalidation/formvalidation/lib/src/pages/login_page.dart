// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo( context ),
        ],
      )
    );
  }
  
  Widget _crearFondo( context ) {
    // Obtenemos el 40% de la pantalla
    final size = MediaQuery.of( context ).size;

    final fondoMorado = Container( 
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ]
        )
      ),
    );

    // Trabajamos los circulos
    final circulos = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    return Stack(
      children: [
        fondoMorado,

        Positioned( top: 90, left: 30, child: circulos ),
        Positioned( top: -40, right: -30, child: circulos ),
        Positioned( bottom: -50, right: -10, child: circulos ),   
        Positioned( bottom: 120, right: 20, child: circulos ),  
        Positioned( bottom: -50, left: -20, child: circulos ),   
        
        Container(
          padding: EdgeInsets.only( top: 80 ),
          child: Column(
            children: [
              Icon( Icons.store_outlined, color: Colors.white, size: 100 ),
              SizedBox( height: 10, width: double.infinity, ),
              Text('PUPUSERIA CHILIN', style: TextStyle( color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold ) ),
            ],
          ),
        ),

      ],
    );

  }
}