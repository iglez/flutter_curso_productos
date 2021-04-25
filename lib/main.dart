// mateapp
import 'package:flutter/material.dart';
import 'package:flutter_curso_productos/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : ( BuildContext context ) => HomePage()
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}