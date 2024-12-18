import 'package:flutter/material.dart';

void main() {
  runApp(RegistrationApp());
}

class RegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration Form'),
        ),
        body: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Implement your registration logic here
              print('Name: ${_nameController.text}');
              print('Email: ${_emailController.text}');
              print('Password: ${_passwordController.text}');
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
