// Step 4: Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			theme: ThemeData.dark(),
			title: 'Startup Name Generator',
			debugShowCheckedModeBanner: false,
			home: new RandomWords(),
		);
	}
}

class RandomWords extends StatefulWidget {
	@override
	createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
	final _suggestions = List<WordPair>();
	final _saved = Set<WordPair>();

	final TextStyle _biggerFont = new TextStyle(
		fontSize: 16.0,
		fontWeight: FontWeight.w300,
	);

	void _pushSaved() {
		Navigator.of(context).push(
			MaterialPageRoute(
				builder: (context) {
					final tiles = _saved.map(
						(pair) {
							return ListTile(
								title: Text(
									pair.asPascalCase,
									style: _biggerFont,
								),
							);
						},
					);
					final divided = ListTile
						.divideTiles(
							context: context,
							tiles: tiles,
						)
						.toList();
					return Scaffold(
						appBar: AppBar(title: Text('Saved Suggestions')),
						body: ListView(children: divided),
					);
				},
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text('Startup Name Generator'),
				centerTitle: true,
				actions: <Widget>[
					IconButton(
						icon: Icon(Icons.list), 
						onPressed: _pushSaved
						),
				],
			),
			body: _buildSuggestions(),
		);
	}

	Widget _buildSuggestions() {
		return new ListView.builder(
			padding: const EdgeInsets.all(20.0),
			itemBuilder: (context, i) {
				if (i.isOdd) return new Divider();

				final index = i ~/ 2;

				if (index >= _suggestions.length) {
					_suggestions.addAll(generateWordPairs().take(10));
				}
				return _buildRow(_suggestions[index]);
			},
		);
	}

	Widget _buildRow(WordPair pair) {

		final alreadySaved = _saved.contains(pair);

		return new ListTile(
			trailing: Icon(
				alreadySaved ? Icons.favorite : Icons.favorite_border,
				color: alreadySaved ? Colors.red.shade300 : null,
			),
			title: new Text(
				pair.asPascalCase,
				style: _biggerFont,
			),
			onTap: () => setState(
					() => alreadySaved? _saved.remove(pair) : _saved.add(pair)
				)
		);
	}
}