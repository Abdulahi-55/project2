import 'package:flutter/material.dart';

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: Text(
            'Registration Form',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 24),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Implement registration logic here
                  String email = emailController.text;
                  String fullName = fullNameController.text;
                  String phoneNumber = phoneController.text;
                  String address = addressController.text;
                  // For demonstration, just print the values
                  print('Email: $email');
                  print('Full Name: $fullName');
                  print('Phone Number: $phoneNumber');
                  print('Address: $address');
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
