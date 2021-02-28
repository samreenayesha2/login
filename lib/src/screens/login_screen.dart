import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            emailField(),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            passwordField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
        ),
        validator: validatePassword,
        onSaved: (String value) {
          password = value;
        },
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: Text('Submit!'),
      onPressed: () {
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          print('Time to post $email and $password to my API');
        }
      },
    );
  }
}
