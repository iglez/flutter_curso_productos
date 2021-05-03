import 'package:flutter/material.dart';
import 'package:flutter_curso_productos/models/producto_model.dart';
import 'package:flutter_curso_productos/providers/productos_provider.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      onPressed: () => Navigator.pushNamed(context, 'producto').then((value) => setState(() {})),
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
          itemBuilder: (context, i) => _crearItem(context, productos[i]),
        );
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel prod) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        productosProvider.eliminarProducto(prod.id);
      },
      child: ListTile(
        title: Text('${prod.titulo} - ${prod.precio}'),
        subtitle: Text('${prod.id}'),
        onTap: () => Navigator.pushNamed(context, 'producto', arguments: prod).then((value) => setState(() {})),
      ),
    );
  }
}
