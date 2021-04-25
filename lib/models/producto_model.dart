// https://app.quicktype.io/?share=4Ik8Upww0mN33e2CBVmq
// {
//     "id": "abc",
//     "titulo": "nombre",
//     "precio": 1.2,
//     "disponible": false,
//     "fotoUrl": "http://"
// }
// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    ProductoModel({
        this.id,
        this.titulo = '',
        this.precio = 0.0,
        this.disponible = false,
        this.fotoUrl,
    });

    String id;
    String titulo;
    double precio;
    bool disponible;
    String fotoUrl;

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id: json["id"],
        titulo: json["titulo"],
        precio: json["precio"].toDouble(),
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "precio": precio,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
    };
}
