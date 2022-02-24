import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flut First',
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _list = <WordPair>[];
  final TextStyle _biggerFont = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);

    return Scaffold(
      appBar: AppBar(
        title: Text('List Bahasa'),
      ),
      body: _buildSugesti(),
    );
  }
  Widget _buildSugesti() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (BuildContext contextbuild, int i) {
        if(i.isOdd){
          return new Divider();
        }
        final int index = i ~/ 2;
        if (index >= _list.length){
          _list.addAll(generateWordPairs().take(10));
        }
        return buildRow(_list[index]);
      }
    );
  }
  Widget buildRow(WordPair pair){
    return new ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      )
    );
  }
}
