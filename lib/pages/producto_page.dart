import 'package:flutter/material.dart';
import 'package:flutter_curso_productos/models/producto_model.dart';
import 'package:flutter_curso_productos/providers/productos_provider.dart';
import 'package:flutter_curso_productos/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  // const ProductoPage({Key key}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final prodProvider = new ProductosProvider();

  ProductoModel producto = ProductoModel();

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;

    if (prodData != null) {
      producto = prodData;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
      onSaved: (value) => producto.titulo = value,
      validator: (String value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del producto';
        }

        return null;
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.precio.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Precio'),
      onSaved: (value) => producto.precio = double.parse(value),
      validator: (String value) {
        if (utils.isNumeric(value)) {
          return null;
        }

        return 'El precio debe de ser un numero';
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: _submit,
      icon: Icon(Icons.save),
      label: Text('Guardar'),
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      title: Text('Disponible'),
      value: producto.disponible,
      activeColor: Colors.deepPurple,
      onChanged: (value) {
        setState(() {
          producto.disponible = value;
        });
      },
    );
  }

  void _submit() {
    bool isValidForm = formKey.currentState.validate();

    if (!isValidForm) {
      return null;
    }

    formKey.currentState.save();

    print('Listo');
    print(producto.titulo);
    print(producto.precio);
    print(producto.disponible);

    if( producto.id == null ) {
      prodProvider.crearProducto(producto);
    } else {
      prodProvider.modificarProducto(producto);
    }
    
  }
}
