// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

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
				// children: _crearItems()
				children: _crearItemsCorto()
			),

		);
	}

	// Primera forma
  // Creamos un método nuevo que devuelva la lista de Widget
  // Ya sabemos que el _ es porque es privada
  // ignore: unused_element
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

		return opciones.map( ( item ) {
			return Column(
			  children: [
			    ListTile(
						// Al inicio
						leading: Icon( Icons.home, size: 35, color: Colors.black12 ),
			    	// ignore: prefer_interpolation_to_compose_strings
			    	title: Text( item + ' !' ),
						subtitle: Text( 'Cualquier cosa desde el subtext' ),
						// Al final
						trailing: Icon( Icons.arrow_forward_ios, size: 35, color: Colors.red[200] ),

						// Con esto vamos hacer una acción al hacer tap
						onTap: (){},

			    ),

					const Divider(height: 1)
			  ],
			);

		}).toList();

	}

}