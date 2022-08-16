import 'package:flutter/material.dart';
import 'package:mongoflutternodeauth/services/authserve.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              onPressed: () {
                // call authenticate endpoint
                AuthService().auth(username, ID, password).then(
                  (value) {
                    if (value.data['success']) {
                      token = value.data['token'];
                      Fluttertoast.showToast(
                        msg: 'Authenticated',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                );
              },
              child: Text("Authenticate"),
              color: Colors.blueAccent,
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
            ),
            RaisedButton(
              color: Colors.greenAccent,
              child: const Text(
                "Get User Info",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // call authenticate endpoint
                AuthService().getInfo(token).then(
                  (value) {
                    Fluttertoast.showToast(
                      msg: value.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.yellowAccent,
                      textColor: Colors.black,
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
