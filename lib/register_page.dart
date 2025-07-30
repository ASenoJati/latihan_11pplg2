import 'package:flutter/material.dart';
import 'package:latihan_11pplg2/components/Gender.dart';
import 'package:latihan_11pplg2/components/MyButton.dart';
import 'package:latihan_11pplg2/components/MyTextField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String selectedGender = '';

  bool isMale = false;
  bool isFemale = false;
  void handleGenderChange(String gender, bool? value) {
    setState(() {
      if (gender == 'Laki-laki') {
        isMale = value ?? false;
        if (value == true) isFemale = false;
      } else {
        isFemale = value ?? false;
        if (value == true) isMale = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text("please fill all required input below"),

            Container(
              margin: EdgeInsets.only(top: 15, bottom: 10),
              child: MyTextField(labelText: "Nama", controller: txtNama),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: MyTextField(
                labelText: "Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: MyTextField(
                labelText: "Password",
                controller: txtPassword,
                isPassword: true,
              ),
            ),

            Row(
              children: [
                Gender(
                  value: 'Laki-laki',
                  groupValue: selectedGender,
                  onChanged: (val) {
                    setState(() {
                      selectedGender = val ?? '';
                    });
                  },
                ),
                SizedBox(width: 20),
                Gender(
                  value: 'Perempuan',
                  groupValue: selectedGender,
                  onChanged: (val) {
                    setState(() {
                      selectedGender = val ?? '';
                    });
                  },
                ),
              ],
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Button(buttonText: "Register", onPressed: () {}),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Login Here',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
