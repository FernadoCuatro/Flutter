// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,

        initialRoute: 'login',
        routes: {
          'login': ( (context) => LoginPage() ),
          'home' : ( (context) => HomePage() ),
        },
        // Vamos a poner un colorcito
        theme: ThemeData(
          primaryColor: Colors.black26
        ),
      ),
    );
  }
}