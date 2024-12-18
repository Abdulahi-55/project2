import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = '0';
  String currentNumber = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      clear();
    } else if (buttonText == '=') {
      calculate();
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      setOperand(buttonText);
    } else {
      appendNumber(buttonText);
    }
  }

  void clear() {
    setState(() {
      output = '0';
      currentNumber = '';
      num1 = 0;
      num2 = 0;
      operand = '';
    });
  }

  void calculate() {
    setState(() {
      num2 = double.parse(currentNumber);
      switch (operand) {
        case '+':
          output = (num1 + num2).toString();
          break;
        case '-':
          output = (num1 - num2).toString();
          break;
        case '×':
          output = (num1 * num2).toString();
          break;
        case '÷':
          if (num2 != 0) {
            output = (num1 / num2).toString();
          } else {
            output = 'Error';
          }
          break;
      }
      currentNumber = output;
      operand = '';
    });
  }

  void setOperand(String buttonText) {
    setState(() {
      operand = buttonText;
      num1 = double.parse(output);
      currentNumber = '';
    });
  }

  void appendNumber(String buttonText) {
    setState(() {
      if (currentNumber == '0') {
        currentNumber = buttonText;
      } else {
        currentNumber += buttonText;
      }
      output = currentNumber;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> buttonNames = [
      '7',
      '8',
      '9',
      '÷',
      '4',
      '5',
      '6',
      '×',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '=',
      '+',
      'C',
    ];

    List<Widget> buttons =
        buttonNames.map((name) => buildButton(name)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24.0),
              child: Text(
                output,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Row(
            children: [
              buildButton('C'),
              buildButton('÷'),
              buildButton('×'),
              buildButton('-'),
            ],
          ),
          Row(
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('+'),
            ],
          ),
          Row(
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('='),
            ],
          ),
          Row(
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('.'),
            ],
          ),
          Row(
            children: [
              buildButton('0'),
            ],
          ),
        ],
      ),
    );
  }
}
