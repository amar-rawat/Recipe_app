import 'package:flutter/material.dart';
import 'package:recipe_app/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            primarySwatch: Colors.deepPurple,
            textTheme:
                const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
        home: const HomePage());
  }
}
