// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        
        // Vamos a crear las apciones para tomar foto o tomarla de la galeria
        actions: [
          IconButton(
            icon: Icon( Icons.photo_size_select_actual ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon( Icons.camera_alt ),
            onPressed: () {},
          )
        ],
      ),

      // Body
      body: SingleChildScrollView(
        child: Container( 
          padding: EdgeInsets.all(5),
          // Como si fuera un container pero como un submit en HTML
          child: Form(
            child: Column(
              children: [
                _crearNombre(),
                _crearPrecio(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _crearNombre() {
    // El TextFormField trabaja directamente con un formulario
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre Producto'
      ),
    );
  }
  
  Widget _crearPrecio() {
    // El TextFormField trabaja directamente con un formulario
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
    );
  }
  
  Widget _crearBoton() {
    return ElevatedButton.icon(
      onPressed: (){},
      
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
      ),
      label: Text('Guardar'),
      icon: Icon( Icons.save ),
    );
  }
}