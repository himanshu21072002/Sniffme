// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchPage'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text("Search"),
      ),
    );
  }
}
