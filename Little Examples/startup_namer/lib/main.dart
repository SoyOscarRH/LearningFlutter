import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {


    final someWordPair = WordPair.random();

    return MaterialApp(
      title: 'StartUpNamer',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("StartUp Namer"),
        ),
        body: Center(
          child: Text(someWordPair.asPascalCase),
        )
      )
    );
  }
}

