import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View Navigation'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.calculate), text: 'BMI Calculator'),
            Tab(icon: Icon(Icons.calculate), text: 'Calculator'),
            Tab(icon: Icon(Icons.person), text: 'Registration Form'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BMICalculatorPage(),
          CalculatorPage(),
          RegistrationPage(),
        ],
      ),
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

class BMICalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: BMICalculatorBody(),
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

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _passwordError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorText: _passwordError,
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_passwordController.text != _confirmPasswordController.text) {
                setState(() {
                  _passwordError = 'Passwords do not match';
                });
              } else {
                setState(() {
                  _passwordError = null;
                });
                // Implement your registration logic here
                print('Name: ${_nameController.text}');
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
                print('Confirm Password: ${_confirmPasswordController.text}');
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.blue,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
