import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Login",
              hintText: "Type your login",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Type your password",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 46,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              onPressed: () {
                print("I was clicked");
              },
            ),
          )
        ],
      ),
    );
  }
}
