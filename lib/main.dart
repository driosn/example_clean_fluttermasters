import 'package:example_clean/features/random_dog_image/presentation/screens/random_dog_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: RandomDogScreen(),
    );
  }
}
