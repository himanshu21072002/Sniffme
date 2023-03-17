// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountPage'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(child: Text("Account")),
    );
  }
}
