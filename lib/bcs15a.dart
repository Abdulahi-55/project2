import 'package:flutter/material.dart';

class Assignmet extends StatelessWidget {
  const Assignmet({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Personal information",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 65, 167, 6),
          width: 300,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/image.jpg",
                    width: 100,
                  ),
                  SizedBox(width: 5), // Adding space between the images
                  Image.asset(
                    "images/2.jpg",
                    width: 100,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("Name:  abdulahi isak"),
              Text("Telephone: 619989358"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("call Now"),
                  Icon(Icons.call),
                ],
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.yellow,
                child: Text(
                  "View",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
