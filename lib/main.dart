import 'package:flutter/material.dart';
import 'package:sample_app/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 52, 69, 109)),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
