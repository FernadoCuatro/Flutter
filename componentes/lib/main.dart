import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',

      // Quitamos el molesto debug que aparece arriba
      debugShowCheckedModeBanner: false,

      // home: HomePage(),
      // Definimos las rutas
      initialRoute: '/',
      routes: < String, WidgetBuilder > {
        '/'     : ( BuildContext context) => HomePage(),
        'alert' : ( BuildContext context) => AlertPage(),
        'avatar': ( BuildContext context) => AvatarPage(),
      },

    );
  }
}