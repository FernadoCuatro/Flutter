// Aqui vamos a manejar el archivo json que esta en data

// ignore_for_file: avoid_print

// Para leer este archivo json vamos a ocupar este paquete
// Del service solo traemos lo especifico no todo el texto 
import 'package:flutter/services.dart' show rootBundle;
// El rootBundle tiene lo necesario para leer el json

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarData();
  }
  
  cargarData() {
    // esto devuelve un future 
    rootBundle.loadString('data/menu_opts.json')
      .then( (data) {
        print( data );
      } );
  }
}

// De esta forma solo estamos exponiendo esta instancia no toda la clase
final menuProvider = _MenuProvider();

