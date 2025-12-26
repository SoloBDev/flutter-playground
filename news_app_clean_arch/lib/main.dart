import 'package:flutter/material.dart';
import 'package:news_app_clean_arch/injection_container.dart';

void main() async {
  await initializedDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mulish',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App Clean Architecture'),
      ),
      body: const Center(
        child: Text('Welcome to News App Clean Architecture!'),
      ),
    );
  }

}
