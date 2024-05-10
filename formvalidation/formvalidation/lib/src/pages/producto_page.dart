
// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_null_comparison, use_key_in_widget_constructors, avoid_print, unused_field, avoid_init_to_null

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  
  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  // id para el formulario
  final formKey     = GlobalKey<FormState>();
  // id para el scaffold
  final scaffoldkey = GlobalKey<ScaffoldState>();

  // Propiedad para el modelo
  ProductoModel producto = ProductoModel();
  final productosProvider = ProductosProvider();
  
  // Para verificar que no le demos dos veces al boton de guardar
  bool _guardando = false;

  // Propiedad para almecenar la fotografia
  File? foto = null;

  @override
  Widget build(BuildContext context) {
    // De esta manera estoy tomando el argumento si viene
    final ProductoModel? prodData = ModalRoute.of(context)?.settings.arguments as ProductoModel?;

    if( prodData != null ) {
      producto = prodData;
    }
    
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Producto'),
        
        // Vamos a crear las apciones para tomar foto o tomarla de la galeria
        actions: [
          IconButton(
            icon: Icon( Icons.photo_size_select_actual ),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon( Icons.camera_alt ),
            onPressed: _tomarFoto,
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
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
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
      // inicializamos el valor con la propiedad de la clase
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre Producto'
      ),
      // El onsave se ejecuta luego del validator
      onSaved: ( value ) => producto.titulo = value!,
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
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      // El onsave se ejecuta luego del validator
      onSaved: ( value ) => producto.valor = double.parse(value!),
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
      onPressed: ( _guardando ) ? null : _submit,
      
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
  
  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      // activeColor: Colors.black38,
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
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
    // disparamos los onsave
    // Esto dispara todos los text form field que esten en el formulario
    formKey.currentState!.save();
    
    // Guadamos el estado
    setState(() {
      _guardando = true;
    });

    // print( producto.titulo );
    // print( producto.valor );
    // print( producto.fotoUrl );

    // Creamos un producto porque no existe
    if( producto.id == '' ) {
      // print("Nuevo");
      productosProvider.crearProducto( producto );

      mostrarSnackbar( 'Registro guardado' );
    // editamos el producto porque ya existe
    } else {
      // print("editar");
      productosProvider.editarProducto( producto );

      mostrarSnackbar( 'Registro actualizado' );
    }

    setState(() {
      _guardando = false;
    });

    // volvemos al listado de los productos
    Navigator.pop(context);
  }

  // Para mostrar el mensaje cuando se guarda
  void mostrarSnackbar ( String mensaje ){
    final snackbar = SnackBar(
      content: Text( mensaje ),
      duration: Duration(milliseconds:  1500),
    );

    ScaffoldMessenger.of(context).showSnackBar( snackbar );
  }

  // Mostramos la foto 
  Widget _mostrarFoto() {
    // print(foto?.path);

    // print( producto.fotoUrl );
    if( producto.fotoUrl == '' ) {
      // Si no tenemos foto usamos una foto asignada

      if(foto?.path != null) {
        return Image.network(
            foto!.path,
            height: 300.0,
            fit: BoxFit.cover,
          );
      } else {
        return Image(
          image: AssetImage('assets/no-image.png'),
          height: 300.0,
          fit: BoxFit.cover,
        );
      }      
    } else {

      return Container();
    }
  }

  // Metodo para el manejo de imagenes
 _seleccionarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        foto = File(pickedFile.path);
      });
    }
 }

  _tomarFoto() {

  }

}
