// mateapp
import 'package:flutter/material.dart';
import 'package:flutter_curso_productos/pages/home_page.dart';
import 'package:flutter_curso_productos/pages/producto_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : ( BuildContext context ) => HomePage(),
        'producto' : ( BuildContext context ) => ProductoPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}