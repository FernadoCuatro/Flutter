// Este archivo se va a encargar de hacer todas las interacciones en la base de datos
// ignore_for_file: avoid_print, unnecessary_null_comparison, unused_local_variable, avoid_function_literals_in_foreach_calls, unused_import, unused_field
import 'package:formvalidation/src/models/producto_model.dart';
// importamos http
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductosProvider {
  // Como necesitamos hacer peticiones HTTP exportamos el paquete en el pubspec.yaml

  // Url de la base de datos de firabase
  final String _url = 'https://pupuseria-chilin-default-rtdb.firebaseio.com';
  
  // Agregamos un producto a la base de datos
  Future<bool> crearProducto(ProductoModel producto) async {
    try {
      // Referencia a la colección "Productos" en Firestore
      CollectionReference productosRef = FirebaseFirestore.instance.collection('Productos');

      // Agregamos un nuevo documento con los datos del producto
      await productosRef.add({
        'descripcion'    : producto.descripcion,
        'estado'         : producto.estado,
        'idCategoria'    : producto.idCategoria,
        'imagen'         : producto.imagen, // Añade la imagen si es necesario
        'isFeatured'     : producto.isFeatured,
        'nombre'         : producto.nombre,
        'nombreCategoria': producto.nombreCategoria,
        'precio'         : producto.precio,
        'tipoProducto'   : 'ProductType.single',

        // Mapa adicional después de 'tipoProducto'
        'attributosProducto': [
          {
            'nombre': 'Tipo de Masa',
            'valor': ['Arroz', 'Maiz']
          }
        ]
      });

      return true;
    } catch (e) {
      // Manejo de errores
      print("Error al crear el producto: $e");
      return false;
    }
  }

  // Editamos un producto
  Future<bool> editarProducto(ProductoModel producto) async {
    try {
      // Referencia al documento que queremos editar
      DocumentReference productoRef = FirebaseFirestore.instance.collection('Productos').doc(producto.id);

      // Actualizamos los campos que deseamos modificar
      await productoRef.update({
        'descripcion'    : producto.descripcion,
        'estado'         : producto.estado,
        'idCategoria'    : producto.idCategoria,
        'isFeatured'     : producto.isFeatured,
        'nombre'         : producto.nombre,
        'nombreCategoria': producto.nombreCategoria,
        'precio'         : producto.precio,
        'tipoProducto'   : producto.tipoProducto
      });

      return true;
    } catch (e) {
      // Manejo de errores
      print("Error al editar el producto: $e");
      return false;
    }
  }

  Future<List<ProductoModel>> cargarProductos() async {
    try {
      // Accedemos a la colección "Productos"
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Productos').get();

      // Lista para almacenar los productos
      List<ProductoModel> productos = [];

      // Iteramos sobre los documentos obtenidos
      querySnapshot.docs.forEach((doc) {
        // Convertimos cada documento a un objeto ProductoModel
        ProductoModel producto = ProductoModel(
          id: doc.id, // Aquí asignamos el ID del documento
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
  Future<int> borrarProducto(String id) async {
    // // Necesitamos la url para el listado de los productos
    // final url = '$_url/productos/$id.json';

    // // Cargamos la peticion
    // final resp = await http.delete( Uri.parse(url) );

    try {
      // Referencia al documento que queremos eliminar
      DocumentReference productoRef = FirebaseFirestore.instance.collection('Productos').doc(id);

      // Eliminamos el documento 
      await productoRef.delete();

      return 1; // Éxito al borrar el producto
    } catch (e) {
      // Manejo de errores
      print("Error al borrar el producto: $e");
      return 0; // Error al borrar el producto
    }
  }

}