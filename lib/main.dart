import 'package:flutter/material.dart';
import './random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /**
   * Builds the app
   * The appBar theme colour is Purple with a 900 variant
   * We make home a separate class RandomWords
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: RandomWords());
  }
}
