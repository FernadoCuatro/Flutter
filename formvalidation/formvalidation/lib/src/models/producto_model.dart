// ignore_for_file: unnecessary_new

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  // Propiedades
  String id;
  String titulo;
  double valor;
  bool disponible;
  String fotoUrl;

  // Constructor
  ProductoModel({
    required this.id,
    this.titulo     = '',
    this.valor      = 0.0,
    this.disponible = true,
    required this.fotoUrl,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) => new ProductoModel(
    id         : json["id"],
    titulo     : json["titulo"],
    valor      : json["valor"],
    disponible : json["disponible"],
    fotoUrl    : json["fotoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id"         : id,
    "titulo"     : titulo,
    "valor"      : valor,
    "disponible" : disponible,
    "fotoUrl"    : fotoUrl,
  };
}
