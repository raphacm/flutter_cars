import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();

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
          _textFormField("Login", "Type your login",
              callback: (value) => print(value), controller: _controllerLogin),
          SizedBox(
            height: 20,
          ),
          _textFormField("Password", "Type your password",
              isPassword: true,
              callback: (value) => print(value),
              controller: _controllerPassword),
          SizedBox(
            height: 20,
          ),
          _button(
            "Login",
            _handleLoginClick,
          )
        ],
      ),
    );
  }

  void _handleLoginClick() {
    var login = _controllerLogin.text;
    var password = _controllerPassword.text;

    if (login.isNotEmpty && password.isNotEmpty) {
      print("Your login is $login and password is $password");
    } else {
      print("You should fill out all informations");
    }
  }

  TextFormField _textFormField(
    String label,
    String hint, {
    TextEditingController controller,
    bool isPassword = false,
    Function callback,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => callback(value),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      obscureText: isPassword,
    );
  }

  Container _button(
    String label,
    Function onPressed, {
    Color color = Colors.blue,
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
        onPressed: onPressed,
      ),
    );
  }
}
