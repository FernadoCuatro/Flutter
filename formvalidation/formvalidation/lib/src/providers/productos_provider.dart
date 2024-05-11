// Este archivo se va a encargar de hacer todas las interacciones en la base de datos
// ignore_for_file: avoid_print, unnecessary_null_comparison, unused_local_variable, avoid_function_literals_in_foreach_calls
import 'dart:convert';

import 'package:formvalidation/src/models/producto_model.dart';
// importamos http
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

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
    // Necesitamos apuntar al nodo de productos por medio de id
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
    try {
      // Accedemos a la colección "Productos" en Firestore
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Productos').get();

      // Lista para almacenar los productos
      List<ProductoModel> productos = [];

      // Iteramos sobre los documentos obtenidos
      querySnapshot.docs.forEach((doc) {
        // Convertimos cada documento a un objeto ProductoModel
        ProductoModel producto = ProductoModel(
          descripcion    : doc['descripcion'],
          estado         : doc['estado'],
          idCategoria    : doc['idCategoria'],
          imagen         : doc['imagen'],
          isFeatured     : doc['isFeatured'],
          nombre         : doc['nombre'],
          nombreCategoria: doc['nombreCategoria'],
          precio         : doc['precio'],
          tipoProducto   : doc['tipoProducto'],
        );

        // Agregamos el producto a la lista
        productos.add(producto);
      });

      return productos;
    } catch (e) {
      // Manejo de errores
      print("Error al cargar productos: $e");
      return []; // Retorna una lista vacía en caso de error
    }
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