import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fridge/models/user.dart';
import 'package:fridge/main.dart';


class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(userProvider);
    return Scaffold(
      body: SafeArea(
          child: TextButton(
        child: Text('LOG OUT'),
        onPressed: () async {
          await user.state.logout();
          Navigator.pushNamed(context, '/');
        },
      )),
    );
  }
}
