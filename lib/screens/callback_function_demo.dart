import 'package:flutter/material.dart';

import '../shared/bottom_nav.dart';
import '../shared/menu_drawer.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List<String> quotesRecord = ['Quote #1', 'Quote #2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNav(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: quotesRecord
              .map((quote) => Card(
                    margin: const EdgeInsets.all(2),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(children: <Widget>[Text(quote)]),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  final String quote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: const EdgeInsets.all(2),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(children: <Widget>[Text(quote)]),
        ),
      ),
    );
  }
}
