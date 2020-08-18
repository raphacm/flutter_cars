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

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          _textFormField(
            "Login",
            "Type your login",
            callback: (value) => print(value),
          ),
          SizedBox(
            height: 20,
          ),
          _textFormField(
            "Password",
            "Type your password",
            isPassword: true,
            callback: (value) => print(value),
          ),
          SizedBox(
            height: 20,
          ),
          _button("Login", onClick: () => print("I was clicked"))
        ],
      ),
    );
  }

  TextFormField _textFormField(
    String label,
    String hint, {
    bool isPassword = false,
    Function callback,
  }) {
    return TextFormField(
      onChanged: (value) => callback(value),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      obscureText: isPassword,
    );
  }

  Container _button(
    String label, {
    Color color = Colors.blue,
    Function onClick,
  }) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: color,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          onClick();
        },
      ),
    );
  }
}
