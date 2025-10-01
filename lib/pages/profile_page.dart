import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("images/05542.jpg"),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text("A Seno Jati"),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text("senojati16@gmail.com"),
            ),
          ],
        ),
      ),
    );
  }
}
