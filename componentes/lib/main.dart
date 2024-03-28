import 'package:componentes/src/pages/home_temp.dart';
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

	  home: Scaffold(
		appBar: AppBar(
		  title: const Text('Componentes'),
		),
		// Asi estaba por defectp pero vamos usar el home_temp.dart para que muestre la data
		// body: const Center(
		//   child: Text('Hello World'),
		// ),
		body: HomePageTemp(),
	  ),
	);
  }
}