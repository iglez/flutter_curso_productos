import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

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

  Future<bool> modificarProducto(ProductoModel producto) async {
    // https://flutter-curso-5f131-default-rtdb.firebaseio.com/productos
    final url = '$_url/productos/${producto.id}.json';

    final resp = await http.put(url, body: productoModelToJson(producto));
    final decodedDaata = json.decode(resp.body);

    print(decodedDaata);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    // https://flutter-curso-5f131-default-rtdb.firebaseio.com/productos
    final url = '$_url/productos.json';

    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = List();

    if (decodedData == null) return [];

    decodedData.forEach((key, value) {
      print(key);
      print(value);
      final prodTemp = ProductoModel.fromJson(value);
      prodTemp.id = key;
      productos.add(prodTemp);
    });

    print(productos.first.id);

    return productos;
  }

  Future<int> eliminarProducto(String id) async {
    // https://flutter-curso-5f131-default-rtdb.firebaseio.com/productos/-MZAnaCf9nB3i3TnDByL.json
    final url = '$_url/productos/$id.json';

    final resp = await http.delete(url);
    print(json.decode(resp.body)); // null

    return -1;
  }

  Future<String> subirImagen(File imagen) async {
    Uri url = Uri.parse(
        'https://api.cloudinary.com/v1_1/fluttercurso/image/upload?upload_preset=wgb7irc6');

    List<String> mimeType = mime(imagen.path).split('/'); // imagen/jpg

    // request para adjuntar imagen
    final imageUploadRequest = http.MultipartRequest('POST', url);

    // crear archivo para adjuntar
    final file = await http.MultipartFile.fromPath(
      'file',
      imagen.path,
      contentType: MediaType(mimeType.first, mimeType.last),
    );

    // adjuntar archivo
    imageUploadRequest.files.add(file);

    // enviar request
    final streamResponse = await imageUploadRequest.send();
    // obtener respuesta
    final resp = await http.Response.fromStream(streamResponse);

    // validar codigo de respuesta
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);

    print(respData);

    return respData['secure_url'];
  }
}
