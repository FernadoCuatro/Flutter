// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  // Las listas en dart empiezan en base cero
  List<int> _listaNumeros = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),

      body: _crearLista(),

    );
  }


  Widget _crearLista() {
    return ListView.builder(
      // Cuando no se sae cuantos elementos tienes en la pagina o son muchos elementos
      // Y no quieres que los cargue todos de un solo solamente los que son necesarios
      itemCount: _listaNumeros.length , // Cuantos elementos tiene la lista en este momento
      // Builder significa la forma en que se va a dibujar este elemento 
      itemBuilder: ( BuildContext context, int index ) {
        
        final imagen = _listaNumeros[index];

        return FadeInImage(
          placeholder: AssetImage('assets/preloader.gif'),
          image: NetworkImage('https://miro.medium.com/v2/resize:fit:1200/1*mdEafnxcpRUuWi5aAOIteA.jpeg'),
        );
      },
    );
  }

}