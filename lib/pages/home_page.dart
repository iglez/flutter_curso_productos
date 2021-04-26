import 'package:flutter/material.dart';
import 'package:flutter_curso_productos/models/producto_model.dart';
import 'package:flutter_curso_productos/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  final ProductosProvider productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<ProductoModel> productos = snapshot.data;

        return ListView.builder(
          itemCount: productos.length,
          itemBuilder: (_, i) {
            return Container();
          },
        );
      },
    );
  }
}
