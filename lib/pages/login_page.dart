import 'package:flutter/material.dart';
import 'package:flutter_cars/utils/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerLogin = TextEditingController();

  final _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusLogin = FocusNode();

  final _focusPassword = FocusNode();

  @override
  void initState() {
    super.initState();
  }

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
            _textFormField(
              "Login",
              "Type your login",
              callback: (value) => print(value),
              controller: _controllerLogin,
              validator: (text) => validateLoginField(text),
              inputType: TextInputType.emailAddress,
              nextFocus: _focusPassword,
            ),
            SizedBox(
              height: 20,
            ),
            _textFormField(
              "Password",
              "Type your password",
              isPassword: true,
              callback: (value) => print(value),
              controller: _controllerPassword,
              validator: (text) => validatePasswordField(text),
              inputType: TextInputType.number,
              inputAction: TextInputAction.go,
              focusNode: _focusPassword,
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

  TextFormField _textFormField(
    String label,
    String hint, {
    TextEditingController controller,
    bool isPassword = false,
    Function callback,
    FormFieldValidator<String> validator,
    TextInputType inputType,
    TextInputAction inputAction,
    FocusNode focusNode,
    FocusNode nextFocus,
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
      keyboardType: inputType,
      textInputAction: inputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(_focusPassword);
        }
      },
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

  void _handleLoginClick() {
    var login = _controllerLogin.text;
    var password = _controllerPassword.text;

    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    print("Your login is $login and password is $password");
  }
}
