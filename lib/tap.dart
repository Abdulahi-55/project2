import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    TabOne(),
    TabTwo(),
    TabThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Navigation'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tab 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tab 3',
          ),
        ],
      ),
    );
  }
}

class TabOne extends StatelessWidget {
  const TabOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tab One',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class TabTwo extends StatelessWidget {
  const TabTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tab Two',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class TabThree extends StatelessWidget {
  const TabThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tab Three',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
