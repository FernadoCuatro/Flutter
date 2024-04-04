// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  // Es el controlador del Scroll de la lista
  ScrollController _scrollController = ScrollController();

  // Las listas en dart empiezan en base cero
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;

  @override
  void initState() {
    super.initState();

    // Listener al _scrollController
    _scrollController.addListener((){
      // print('scroll');
      if(_scrollController.position.pixels == (_scrollController.position.maxScrollExtent - 10) ) {
        _agregar5();
      }
    });

    _agregar5();
  }

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
      controller: _scrollController,
      // Cuando no se sae cuantos elementos tienes en la pagina o son muchos elementos
      // Y no quieres que los cargue todos de un solo solamente los que son necesarios
      itemCount: _listaNumeros.length , // Cuantos elementos tiene la lista en este momento
      // Builder significa la forma en que se va a dibujar este elemento 
      itemBuilder: ( BuildContext context, int index ) {
        
        // final imagen = _listaNumeros[index];

        return FadeInImage(
          placeholder: AssetImage('assets/preloader.gif'),
          image: NetworkImage('https://miro.medium.com/v2/resize:fit:1200/1*mdEafnxcpRUuWi5aAOIteA.jpeg'),
        );
      },
    );
  }

  void _agregar5() {
    for(var i = 1; i <= 5; i++) {
      _ultimoItem++;
      _listaNumeros.add( _ultimoItem );
    }

    setState(() {});
  }

}