// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre = "";
  String _email  = "";
  String _pw     = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _crearInput(),

          SizedBox(height: 50),

          _crearEmail(),

          SizedBox(height: 50),

          _crearPw(),

          SizedBox(height: 50),

          _crearPersona(),

        ],
      ),
    );
  }
  
  Widget _crearInput() {
    // TextFormField es mas para trabajar en un formulario y validar
    // Este TextField trabaja mejor de forma independiente
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Escribe',
        labelText: 'Nombre completo',
        helperText: 'Sólo escribe letras',
        suffixIcon: Icon( Icons.accessible ),
        icon: Icon( Icons.account_circle_outlined )
      ),
      onChanged: ( valor ){
        setState(() {
          _nombre = valor; 
          // print( _nombre );
        });
      },
    );
  }
  
  Widget _crearPersona() {
    return ListTile(
      leading: Icon( Icons.precision_manufacturing_outlined, size: 40 ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nombre es: $_nombre'),
          Text('Email: $_email'),
          Text('Pass: $_pw'),
        ],
      ),
    );
  }
  
  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: 'Correo electrónico',
        labelText: 'Email Address',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email )
      ),
      onChanged: ( valor ){
        setState(() { _email = valor; });
      },
    );
  }
  
  Widget _crearPw() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: 'Contraseña',
        labelText: 'Password',
        suffixIcon: Icon( Icons.password ),
        icon: Icon( Icons.lock )
      ),
      onChanged: ( valor ){
        setState(() { _pw = valor; });
      },
    );
  }
}