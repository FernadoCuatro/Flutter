// Aqui viene el inheritedWidget
// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';
export 'package:formvalidation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  // Propiedad
  final loginBloc = LoginBloc();

  // Constructor
  Provider({ Key? key, required Widget child })
    : super(key: key, child: child);

  // Sobre escribimos
  // Mas o menos dice que al actualizarse debe notificar a sus hijos
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  // Ocupamos la instancia del LoginBloc
  // Que regrese el estado de esa instancia
  static LoginBloc? of(BuildContext context) {
    final Provider? parentProvider = context.dependOnInheritedWidgetOfExactType<Provider>();
    return parentProvider?.loginBloc;
  }
}