// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email  = "";
  String _pw     = "";
  String _fecha  = "";
  String _opcionSeleccionada = "Volar";

  final List< String > _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  // Propiedad para ponerle la fecha seleccionada a la fecha de nacimineto 
  final TextEditingController _inputFieldDateController = TextEditingController(); 

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

          _crearFecha( context ),
          SizedBox(height: 50),

          _crearDropDown(),
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
      trailing: Text(_opcionSeleccionada),
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
  
  Widget _crearFecha( BuildContext context ) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.calendar_month ),
        icon: Icon( Icons.calendar_today )
      ),
      onTap: () {
        // Le quitamos el focus al elemento del input
        FocusScope.of( context ).requestFocus( FocusNode() ); 

        _selectDate( context );
      },
    );
  }
  
  void _selectDate( BuildContext context ) async {
    // Para almacenar fecha
    DateTime? picked = await  showDatePicker( 
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),

      locale: Locale('es', 'ES'),
     );
     
     if (picked != null) {
      setState(() {
        _fecha = picked.toString();

        _inputFieldDateController.text = _fecha;
      }); 
     }
  }
  
  List< DropdownMenuItem<String> > getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = [];

    for (var poder in _poderes) {
      lista.add( DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
    } 

    return lista;
  }
  Widget _crearDropDown() {
    return Row(
      children: [
        Icon( Icons.select_all_rounded ),
        SizedBox( width: 30 ),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropDown(),
          onChanged: ( opcion ) { 
            // print( opcion );
            setState(() {
              _opcionSeleccionada = opcion!;
            });
          } ,
        )
      ],
    );
  }
}