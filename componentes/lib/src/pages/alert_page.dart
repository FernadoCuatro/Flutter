// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),

      // Boton de la esquina
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.account_tree_rounded ),
        onPressed: () {
          Navigator.pop( context );
        },
      ),
    );
  }
}