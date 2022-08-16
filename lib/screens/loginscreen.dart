import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/authserve.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var username, ID, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "username",
              ),
              onChanged: (value) {
                username = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "ID",
              ),
              onChanged: (value) {
                ID = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "password",
              ),
              obscureText: false,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Colors.greenAccent,
              child: const Text(
                "Add User",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // call authenticate endpoint
                AuthService().addUser(username, ID, password).then(
                  (value) {
                    Fluttertoast.showToast(
                      msg: value.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
