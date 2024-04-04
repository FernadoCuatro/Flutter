// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool  _bloquearCheck = false;

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
            _crearCheckBox(),
            _crearSwitch(),
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
      min: 100,
      max: 500,
      value: _valorSlider,
      // Para validar el true o el falso del bloquearCheck para el Slider
      onChanged: ( _bloquearCheck ) ? null : ( valor ) {
      
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
  
  Widget _crearCheckBox() {
    // Retorna un valor booleano
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: ( valor ) {
      
    //     setState(() {
    //       _bloquearCheck = valor!;
    //     });
      
    //   },
    // );

    return Container(
      padding: EdgeInsets.only(left: 75, right: 75),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero, // Eliminar el relleno predeterminado
        title: Padding(
          padding: const EdgeInsets.only(left: 200.0), // Agregar relleno a la izquierda
          child: Text('Bloquear Siliders'),
        ),
        value: _bloquearCheck,
        onChanged: ( valor ) {
        
          setState(() {
            _bloquearCheck = valor!;
          });
        
        },
      ),
    );

  }
  
  Widget _crearSwitch() {
   return Container(
     padding: EdgeInsets.only(left: 75, right: 75),
     child: SwitchListTile(
        contentPadding: EdgeInsets.zero, // Eliminar el relleno predeterminado
        title: Padding(
          padding: const EdgeInsets.only(left: 200.0), // Agregar relleno a la izquierda
          child: Text('Bloquear Siliders'),
        ),
        value: _bloquearCheck,
        onChanged: ( valor ) {
        
          setState(() {
            _bloquearCheck = valor;
          });
        
        },
      ),
   );
  }

}