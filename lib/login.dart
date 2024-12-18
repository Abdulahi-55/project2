import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BackgroundImage(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final Widget child;

  const BackgroundImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            'images/background.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 180.0), // Adjusted for the image height
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Add your login logic here
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
