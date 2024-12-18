import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            text: TextSpan(
              text: 'Hello ',
              style: TextStyle(
                  color: Color.fromARGB(255, 240, 20, 218), fontSize: 20.0),
              children: [
                TextSpan(
                  text: 'Flutter!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                TextSpan(
                  text: ' This is a TextSpan example.',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
