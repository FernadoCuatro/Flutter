// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar page'),
        // Una lista de Widget
        actions: [

          Container(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://m.media-amazon.com/images/I/31xqvr1KuxL.png'),
              // radius: 25,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), // Ajusta el valor según sea necesario
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Ajusta el valor según sea necesario
            child: FadeInImage(
              placeholder: AssetImage('assets/preloader.gif'),
              image: NetworkImage('https://pbs.twimg.com/media/GGg0evja8AA3aop.jpg:large'),
              fadeInDuration: Duration(milliseconds: 200),
            ),
          ),
        ),
      ),
    );
  }
}