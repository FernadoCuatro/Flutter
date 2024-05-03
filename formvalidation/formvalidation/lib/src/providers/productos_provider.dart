// Este archivo se va a encargar de hacer todas las interacciones en la base de datos
// ignore_for_file: avoid_print, unnecessary_null_comparison, unused_local_variable
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
    // print( decodedData );

    return true;
  }

  // Editamos un producto
  Future<bool> editarProducto( ProductoModel producto ) async {
    // Necesitamos apuntar al nodo de productos
    final url = '$_url/productos/${ producto.id }.json';

    // Peticion HTTP para hacer un posteo de informacion
    // para actualizar es el put, el put reemplaza
    final resp = await http.put(Uri.parse(url), body: productoModelToJson( producto ) );

    // Manejamos la respuesta
    final decodedData = json.decode( resp.body );
    // print( decodedData );

    return true;
  }

  // Vamos a listar los productos desde la base de datos
  Future<List<ProductoModel>> cargarProductos() async {
    // Necesitamos la url para el listado de los productos
    final url = '$_url/productos.json';
    
    // obtenemos los datos
    final resp = await http.get(Uri.parse(url));

    // Para trabajar el mapeo de los campos
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    // print (decodedData);
    
    // Validamos si hay datos o no
    if( decodedData == null ) return [];

    final List<ProductoModel> productos = [];

    // Barremos la informacion para que el id esta amarrado a los datos
    decodedData.forEach( (id, producto) {
      // print( id );       -NwX7Esq-qEbWpa0I893
      // print( producto ); {disponible: true, fotoUrl: , id: , titulo: Producto 3, valor: 2.5}

      final productoTemporal = ProductoModel.fromJson( producto );
      productoTemporal.id    = id;

      // Almacenamos el producto temporal al listado general
      productos.add( productoTemporal );
    });

    // print( productos );
    return productos;
  }

  // Vamos a borrar un item aqui
  Future<int> borrarProducto(id) async {
    // Necesitamos la url para el listado de los productos
    final url = '$_url/productos/$id.json';

    // Cargamos la peticion
    final resp = await http.delete( Uri.parse(url) );

    // Manejamos la respuesta
    return 1;
  }
}