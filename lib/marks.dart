import 'package:flutter/material.dart';

void main() {
  runApp(Marks());
}

class Marks extends StatefulWidget {
  @override
  _MarksState createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  final TextEditingController subject1Controller = TextEditingController();
  final TextEditingController subject2Controller = TextEditingController();
  final TextEditingController subject3Controller = TextEditingController();
  final TextEditingController subject4Controller = TextEditingController();
  final TextEditingController subject5Controller = TextEditingController();

  double totalMarks = 0;
  double averageMarks = 0;
  String grade = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Subject Marks Calculator",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 30, 233, 37),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: subject1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'C++',
                ),
              ),
              TextField(
                controller: subject2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Mobile App'),
              ),
              TextField(
                controller: subject3Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Operating System'),
              ),
              TextField(
                controller: subject4Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Multimedia'),
              ),
              TextField(
                controller: subject5Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'IT project'),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        subject1Controller.clear();
                        subject2Controller.clear();
                        subject3Controller.clear();
                        subject4Controller.clear();
                        subject5Controller.clear();
                        totalMarks = 0;
                        averageMarks = 0;
                        grade = '';
                      });
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        totalMarks = double.parse(subject1Controller.text) +
                            double.parse(subject2Controller.text) +
                            double.parse(subject3Controller.text) +
                            double.parse(subject4Controller.text) +
                            double.parse(subject5Controller.text);
                        averageMarks = totalMarks / 5;
                        if (averageMarks >= 95) {
                          grade = 'A+';
                        } else if (averageMarks >= 90) {
                          grade = 'A';
                        } else if (averageMarks >= 85) {
                          grade = 'A-';
                        } else if (averageMarks >= 80) {
                          grade = 'B+';
                        } else if (averageMarks >= 75) {
                          grade = 'B';
                        } else if (averageMarks >= 70) {
                          grade = 'B-';
                        } else if (averageMarks >= 65) {
                          grade = 'C';
                        } else if (averageMarks >= 60) {
                          grade = 'C-';
                        } else if (averageMarks >= 55) {
                          grade = 'D';
                        } else if (averageMarks >= 50) {
                          grade = 'D-';
                        } else {
                          grade = 'F';
                        }
                      });
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Total Marks: $totalMarks',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Average Marks: $averageMarks',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Grade: $grade',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
