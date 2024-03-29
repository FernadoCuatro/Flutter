// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

// es privada
// La {} es para definir un mapa
final _icons = <String, IconData> {
  'add_alert'    : Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open'  : Icons.folder_open,

};

Icon getIcon( String nombreIcono ) {
  return Icon( _icons[nombreIcono], color: Color(0xFF1d9bf0) );
}