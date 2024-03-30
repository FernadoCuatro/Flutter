// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),

      // Un body centrado
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlert( context ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[300],
            shape: StadiumBorder(),
            foregroundColor: Colors.white
          ),
        ),
      ),

      // Boton de la esquina para cerrar el texto
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.arrow_back_ios_new ),
        onPressed: () {
          Navigator.pop( context );
        },
      ),
    );
  }
  
  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ( context ) {
        return AlertDialog(
          title: Text('Titulo'),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Que se adapte al contenido que tiene interno
            children: [
              Text('Este es el contenido de la caja de la alerta'),
              SizedBox(height: 10), // el espacio
              FlutterLogo( size: 100 ) // el size va en pixeles
            ],
          ),

          // Para los botones
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of( context ).pop(),
            ),

            TextButton(
              child: Text('Siguiente'),
              onPressed: (){
                Navigator.of( context ).pop();
              },
            ),

          ],
        );
      }
    );
  }
}