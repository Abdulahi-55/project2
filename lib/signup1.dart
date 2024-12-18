import 'package:flutter/material.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String SignUpMessage = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "SIGN UP ",
            style: TextStyle(
              color: Colors.amber,
              //fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 30, 233, 121),
        ),
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller1,
                    keyboardType: TextInputType.text,
                    decoration:
                        InputDecoration(labelText: 'Enter New Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a new Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller2,
                    keyboardType: TextInputType.text,
                    decoration:
                        InputDecoration(labelText: 'Confirm-Your new Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the Confirmation of the New Password';
                      }
                      /*if (value != controller1.text) {
                        return 'Passwords do not match';
                      }*/
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState != null &&
                          _formkey.currentState!.validate()) {
                        if (controller2.text != controller1.text) {
                          setState(() {
                            SignUpMessage = "Passwords do not match";
                          });
                        }
                        if (controller2.text == controller1.text) {
                          setState(() {
                            SignUpMessage = "SignUped Succesfully!";
                          });
                        }
                      }
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(SignUpMessage),
                ],
              )),
        ),
      ),
    );
  }
}
