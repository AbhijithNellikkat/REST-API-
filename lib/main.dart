import 'package:flutter/material.dart';
import 'package:rest_api_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
