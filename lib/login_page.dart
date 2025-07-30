import 'package:flutter/material.dart';
import 'package:latihan_11pplg2/components/MyButton.dart';
import 'package:latihan_11pplg2/components/MyTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String statusLogin = "Login Status";
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                width: 100,
                child: Image.asset('images/logosmk.png'),
              ),
            ),

            Text(
              "Welcome to our application",
              style: TextStyle(
                fontFamily: "manrope",
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text("please fill username and passaword below"),

            Container(
              margin: EdgeInsets.only(top: 15, bottom: 10),
              child: MyTextField(
                controller: txtUsername,
                labelText: "Username",
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: MyTextField(
                controller: txtPassword,
                labelText: "Password",
                isPassword: true,
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Button(
                buttonText: "Login",
                onPressed: () {
                  if (txtUsername.text == "admin" &&
                      txtPassword.text == "admin") {
                    setState(() {
                      statusLogin = "Sukses Login";
                    });
                  } else {
                    setState(() {
                      statusLogin = "Gagal Login";
                    });
                  }
                },
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Register Here',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),

            Text(statusLogin),
          ],
        ),
      ),
    );
  }
}
