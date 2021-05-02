import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_curso_productos/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://flutter-curso-5f131-default-rtdb.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {

    // https://flutter-curso-5f131-default-rtdb.firebaseio.com/productos
    final url = '$_url/productos.json';

    final resp = await http.post(url, body: productoModelToJson(producto));
    final decodedDaata = json.decode(resp.body);

    print(decodedDaata);
    return true;
  }
}
