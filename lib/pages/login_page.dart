import 'package:flutter/material.dart';
import 'package:flutter_cars/utils/validator.dart';
import 'package:flutter_cars/widgets/button/app_button.dart';
import 'package:flutter_cars/widgets/form/app_formField.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
            AppFormField(
              "Login",
              "Type your login",
              callback: (value) => print(value),
              controller: _controllerLogin,
              validator: (text) => validateLoginField(text),
              keyboardType: TextInputType.emailAddress,
              nextFocus: _focusPassword,
            ),
            SizedBox(
              height: 20,
            ),
            AppFormField(
              "Password",
              "Type your password",
              isPassword: true,
              callback: (value) => print(value),
              controller: _controllerPassword,
              validator: (text) => validatePasswordField(text),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.go,
              focusNode: _focusPassword,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
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
}
