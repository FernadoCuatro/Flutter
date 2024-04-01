// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            _crearSlaider(),
            SizedBox(height: 50),
            _crearImagen(),
          ],
        ),
      ),
    );
  }
  
  Widget _crearSlaider() {
    
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      min: 10,
      max: 400,
      value: _valorSlider,
      onChanged: ( valor ) {
      
        setState(() {
          _valorSlider =  valor;  
        });
        
      },
    );
    
  }
  
  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://d3nv2arudvw7ln.cloudfront.net/staticfolder/Tyre/resources/img/red-parentesi.png'),
      width: _valorSlider,
      fit: BoxFit.cover,
    );
    
  }
}