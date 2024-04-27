// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  
  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  // id para el formulario
  final formKey = GlobalKey<FormState>();

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
            key: formKey,
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
      // Vamos a crear las validaciones
      validator: (value) {
        if ( value!.length < 5 ) {
          return 'Ingrese un nombre de producto valido';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    // El TextFormField trabaja directamente con un formulario
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      // aqui la validacion es importante porque 
      // lleva un numero a fuerza
      validator: ( value ) {
        // Validamos que sea numero
        // si regres true es un numero
        if( utils.isNumeric( value! ) ) {
          return null;
        } else {
          return 'Ingresa un precio valido';
        }
      },
    );
  }

  Widget _crearBoton() {
    return ElevatedButton.icon(
      onPressed: _submit,
      
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

  // Metodo para controlar el submit 
  void _submit() {
    // una forma
    // Verificamos que el formulario es valido
    // if ( formKey.currentState!.validate() ) {
    //   // Cuando el formulario es valido 
    // }

    // Otra forma
    if ( !formKey.currentState!.validate() ) return;

    // Todo el codigo de aqui abajo solamente sucedera cuandoe el formulario sea valido
  

  }
}