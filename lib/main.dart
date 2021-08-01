import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // new Stack(children: <Widget>[
            Expanded(
              flex: 2,
              child: new Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                  child: new Text(
                    'All foods that you can easily in a single app.',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff0D1863),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: new Container(
                // width: ,
                // height: 80.0,
                decoration: new BoxDecoration(
                  color: Color(0xffb74093),
                ),
              ),
            ),
            // ])
          ],
        ),
      ),
    );
  }
}
