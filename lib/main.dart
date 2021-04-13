import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[]; // Array of WordPairs from dependency

  /**
   * ListView Builder is a dynamic ListView
   */
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2; // Get number of wordPairs without Divider

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  /**
   * Generates each ListTile needed in the ListView
   */
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  /**
   * Return app title 
   * Uses the ListView method as the body
   */
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WordPair Generator"),
      ),
      body: _buildList(),
    );
  }
}
