import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: BMICalculatorBody(),
      ),
    );
  }
}

class BMICalculatorBody extends StatefulWidget {
  @override
  _BMICalculatorBodyState createState() => _BMICalculatorBodyState();
}

class _BMICalculatorBodyState extends State<BMICalculatorBody> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _bmiStatus = '';

  void calculateBMI() {
    double height;
    double weight;
    try {
      height = double.parse(_heightController.text);
      weight = double.parse(_weightController.text);
    } catch (exception) {
      // Handle invalid input
      setState(() {
        _bmiResult = 0;
        _bmiStatus = 'Invalid input';
      });
      return;
    }

    if (height <= 0 || weight <= 0) {
      setState(() {
        _bmiResult = 0;
        _bmiStatus = 'Invalid input';
      });
      return;
    }

    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);
    String status;
    if (bmi < 18.5) {
      status = 'Underweight';
    } else if (bmi < 25) {
      status = 'Normal';
    } else {
      status = 'Overweight';
    }
    setState(() {
      _bmiResult = bmi;
      _bmiStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Height (cm)'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Weight (kg)'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              calculateBMI();
            },
            child: Text('Calculate BMI'),
          ),
          SizedBox(height: 20.0),
          _bmiResult != 0
              ? Text(
                  'Your BMI: ${_bmiResult.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20.0),
                )
              : Container(),
          SizedBox(height: 10.0),
          _bmiStatus.isNotEmpty
              ? Text(
                  'Status: $_bmiStatus',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: _bmiStatus == 'Invalid input' ? Colors.red : null,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
