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
  String UserName = "maxamed";
  var Password = 1234;
  String LoginMessage = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "LOGIN",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 189, 233, 30),
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
                        InputDecoration(labelText: 'Enter Your Username'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Your Username';
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
                        InputDecoration(labelText: 'Enter Your Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Your Password';
                      }
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
                        String EnteredUserName = controller1.text.toString();
                        var EnteredPassword = controller2.text.toString();
                        if (EnteredUserName == UserName &&
                            EnteredPassword == Password.toString()) {
                          setState(() {
                            LoginMessage = 'Log in Success!';
                          });
                        } else if (EnteredUserName != UserName ||
                            EnteredPassword != Password.toString()) {
                          setState(() {
                            LoginMessage =
                                'UserName or Password is not Authorized!';
                          });
                        }
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(LoginMessage),
                ],
              )),
        ),
      ),
    );
  }
}
