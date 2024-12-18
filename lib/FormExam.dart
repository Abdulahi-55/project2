import 'package:flutter/material.dart';

class EventandForms extends StatefulWidget {
  const EventandForms({Key? key}) : super(key: key);

  @override
  State<EventandForms> createState() => _EventandFormsState();
}

class _EventandFormsState extends State<EventandForms> {
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String? welcomeMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'Enter first name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Enter last name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    String firstName = firstNameController.text;
                    String lastName = lastNameController.text;
                    setState(() {
                      welcomeMessage = 'Welcome, $firstName $lastName!';
                    });
                  }
                },
                child: Text('Generate Welcome Message'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                welcomeMessage ?? '',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
