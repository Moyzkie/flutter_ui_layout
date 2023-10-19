import 'package:flutter/material.dart';
import 'package:ui_layout/configuration/dependency_injection.dart';
import 'package:ui_layout/view/home.dart';

void main() {
  DependencyInjection.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const Home(),
    );
  }
}


