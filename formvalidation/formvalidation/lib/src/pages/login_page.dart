// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo( context ),

          // Que nos permita hacer scroll
          _loginForm( context ),
        ],
      )
    );
  }
  
  Widget _crearFondo( context ) {
    // Obtenemos el 40% de la pantalla
    final size = MediaQuery.of( context ).size;

    final fondoMorado = Container( 
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(59, 53, 53, 1),
            Color.fromRGBO(47, 44, 44, 1),
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
          padding: EdgeInsets.only( top: 60 ),
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
  
  Widget _loginForm( context ) {

    final size = MediaQuery.of( context ).size;

    // Me permitira hacer scroll dependiendo el largo que tiene el hijo
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  offset: Offset(0, 5),
                  spreadRadius: 3
                )
              ]
            ),
            child: Column(
              children: [
                Text('Ingreso', style: TextStyle( fontSize: 20 ) ),
                SizedBox( height: 60 ),

                _crearEmail(),
                SizedBox( height: 30 ),
                _crearPassword(),
                SizedBox( height: 30 ),
                _crearBoton()
              ],
            ),
          ),
          
          Text('¿Olvidaste la contraseña?'),
          SizedBox( height: 100 )
        ],
      ),
    );
  }
  
  Widget _crearEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon( Icons.alternate_email, color: Colors.deepPurple ),
          hintText: 'ejemplo@correo.com',
          label: Text('Correo electrónico'),
        ),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon( Icons.lock_outline, color: Colors.deepPurple ),
          label: Text('Contraseña'),
        ),
      ),
    );
  }

  Widget _crearBoton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, 
        backgroundColor: Colors.deepPurple, 
        padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.deepPurple),
        ),
        // elevation: 0,
      ),
      child: Text('Ingresar'),
    );
  }
}