// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),

      // Para las tarjetas
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _cardTipo1(),

          // Dejemos espacio de esta y la otra tarjeta
          SizedBox(height: 20),

          _cardTipo2()



        ],
      ),

    );
  }
  
  Widget _cardTipo1() {
    
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue ),
            title: Text('Soy el titulo de la tarjeta'),
            subtitle: Text('La descripcion con el texto que requieren para ver como queda y que se pueda tener la cantidad correcta de texto y todo lo que tiene'),
          ),

          // Colocamos unos botones
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cancelar'),
                onPressed:() {},
              ),

              TextButton(
                child: Text('Siguiente'),
                onPressed:() {},
              )
            ],
          ),

        ],
      ), 
    );
  
  }
  
  Widget _cardTipo2() {

    return Card(
      child: Column(
        children: [
          FadeInImage(
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 400,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/preloader.gif'),
            image: NetworkImage('https://idsb.tmgrup.com.tr/ly/uploads/images/2020/03/20/26192.jpg'),
          ),

          // La version normal
          // Image(
          //   image: NetworkImage('https://idsb.tmgrup.com.tr/ly/uploads/images/2020/03/20/26192.jpg'),
          // ),
          
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Formula 1')
          )
        ],
      ),
    );
  }



}