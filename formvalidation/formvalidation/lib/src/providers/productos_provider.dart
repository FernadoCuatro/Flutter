// Este archivo se va a encargar de hacer todas las interacciones en la base de datos
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:formvalidation/src/models/producto_model.dart';
// importamos http
import 'package:http/http.dart' as http;

class ProductosProvider {
  // Como necesitamos hacer peticiones HTTP exportamos el paquete en el pubspec.yaml

  // Url de la base de datos de firabase
  final String _url = 'https://pupuseria-chilin-default-rtdb.firebaseio.com';
  
  // Creamos productos en la base de datos
  Future<bool> crearProducto( ProductoModel producto ) async {
    // Necesitamos apuntar al nodo de productos
    final url = '$_url/productos.json';

    // Peticion HTTP para hacer un posteo de informacion
    final resp = await http.post(Uri.parse(url), body: productoModelToJson( producto ) );

    // Manejamos la respuesta
    final decodedData = json.decode( resp.body );
    print( decodedData );

    return true;
  }
}