import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Router Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // Define the routes here
      routes: {
        '/home': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the Details Page
            Navigator.pushNamed(context, '/details');
          },
          child: Text('Go to Details Page'),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the Home Page
            Navigator.pop(context);
          },
          child: Text('Back to Home Page'),
        ),
      ),
    );
  }
}
