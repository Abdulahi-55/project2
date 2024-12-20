import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileDesign extends StatelessWidget {
  const ProfileDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/logo.jpeg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'SIMAD University', CupertinoIcons.home),
            const SizedBox(height: 10),
            itemProfile('Phone', '061xxxxxxx', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'Wadada Warshadaha, Warta nabadda',
                CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'info@simad.ed.so', CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile')),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 20),
        ),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.black),
        tileColor: Colors.white,
      ),
    );
  }
}
