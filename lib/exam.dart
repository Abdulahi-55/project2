import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TabBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'home'),
              Tab(icon: Icon(Icons.search), text: 'search'),
              Tab(icon: Icon(Icons.person), text: 'person'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('page 1')),
            Center(child: Text('page 2')),
            Center(child: Text('page 3')),
          ],
        ),
      ),
    );
  }
}
