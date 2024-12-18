import 'package:flutter/material.dart';

class Ass extends StatefulWidget {
  const Ass({Key? key}) : super(key: key);

  @override
  _AssiState createState() => _AssiState();
}

class _AssiState extends State<Ass> {
  String myAge = "20";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          "",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Your age is: "),
            Text(" $myAge "),
            MaterialButton(
              onPressed: pickDob, // Call pickDob function here
              color: Colors.grey,
              child: Text(
                "Pick",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  pickDob() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        calculateAge(pickedDate);
      }
    });
  }

  calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) % 30);
    setState(() {
      myAge = '$years years, $months months and $days days';
    });
  }
}
