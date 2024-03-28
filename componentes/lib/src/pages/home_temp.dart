// ignore_for_file: unnecessary_new, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// Creamos un StatelessWidget
class HomePageTemp extends StatelessWidget {

	// El ListView es como cuando queires que haga scroll en la vista 
	// Como la aplicacion de contactos que se puede hacer scroll con los elementos

	// El ListView esta bien cuando son elementos pocos
	// Pero si son muchos elementos el optimo es el ListView.builder

	// tiene que ser Final pq estoy dentro de un StateLessWidget
	// Una lista de String
	final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis', 'Siete', 'Ocho', 'Nueve', 'Diez'];

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: const Text('Componentes Temp'),
			),

			body: ListView(
				children: _crearItems()
			),

		);
	}

	// Primera forma
  // Creamos un método nuevo que devuelva la lista de Widget
  // Ya sabemos que el _ es porque es privada
  List<Widget> _crearItems() {
		// Una lista dinámica, no estamos definiendo el largo

		// List<Widget> lista = List<Widget>();
		List<Widget> lista = [];

		for (String opcion in opciones) {
			final tempWidget = ListTile(
				title: Text( opcion ),
			);

			// Operador en cascada
			lista..add( tempWidget )
						..add( const Divider(height: 1) );

		}

    return lista;
  }

	// Segunda forma
	List<Widget> _crearItemsCorto() {

		

	}

}