import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _textFormField("Login", "Type your login",
                callback: (value) => print(value),
                controller: _controllerLogin,
                validator: (text) => _validateLoginField(text)),
            SizedBox(
              height: 20,
            ),
            _textFormField(
              "Password",
              "Type your password",
              isPassword: true,
              callback: (value) => print(value),
              controller: _controllerPassword,
              validator: (text) => _validatePasswordField(text),
            ),
            SizedBox(
              height: 20,
            ),
            _button(
              "Login",
              _handleLoginClick,
            )
          ],
        ),
      ),
    );
  }

  void _handleLoginClick() {
    var login = _controllerLogin.text;
    var password = _controllerPassword.text;

    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    print("Your login is $login and password is $password");
  }

  String _validateLoginField(String text) {
    if (text.isEmpty) {
      return "This field can't be null";
    }
    return null;
  }

  String _validatePasswordField(String text) {
    if (text.trim().isEmpty) {
      return "This field can't be null";
    }

    if (text.length < 4) {
      return "Password must be greater than 3";
    }
    return null;
  }

  TextFormField _textFormField(
    String label,
    String hint, {
    TextEditingController controller,
    bool isPassword = false,
    Function callback,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => callback(value),
      validator: validator,
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
