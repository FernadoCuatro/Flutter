// Aqui vamos a manejar el archivo json que esta en data

// ignore_for_file: avoid_print

// Para leer este archivo json vamos a ocupar este paquete
// Del service solo traemos lo especifico no todo el texto 
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
// El rootBundle tiene lo necesario para leer el json

class _MenuProvider {
  List<dynamic> opciones = [];

  // No se puede hacer un constructor asíncrono
  _MenuProvider(){
    cargarData();
  }
  
  // El listado de items pasa antes de que este metodo obtenga la informacion del JSON
  // Por lo tanto necesitamos mandar la informacion de forma sincrona para poder mostrarla en pantalla

  // Vamos a usar el Async and Await
  // En teoría lo que pasa aqui es que le estamos diciendo al cargar data que se espere (await respuesta ) 
  // antes de finalizar el constructor (async)
  // Una función async lo que retorna es un Future
  // En el StatelessWidget vamos a trabajar con el Future builder
  // Que se construya cuando todo este proceso termine
  Future< List<dynamic> > cargarData() async {
    // esto devuelve un future 
    final respuesta = await rootBundle.loadString('data/menu_opts.json');

    // Ahora mismo si trae los datos pero no como un JSON con los objetos si no como texto plano
    // print( data );

    // Vamos a pasarlo a un mapa
    Map dataMap = json.decode( respuesta );
    // print( dataMap['nombreApp'] );
    opciones = dataMap['rutas'];

    return opciones; // es una lista dinámica
  }
}

// De esta forma solo estamos exponiendo esta instancia no toda la clase
final menuProvider = _MenuProvider();
