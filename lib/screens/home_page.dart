import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fridge/services/networking.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: TextButton(
        child: Text('LOG OUT'),
        onPressed: () async {
          await Provider.of<User>(context, listen: false).logout();
          Navigator.pushNamed(context, '/');
        },
      )),
    );
  }
}
