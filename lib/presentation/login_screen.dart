import 'package:flutter/material.dart';
import 'package:flutter_samen_grondwater_meten/presentation/container/user_login_container.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {

  // Logo.
  final logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 64.0,
      child: Image.asset('assets/logo.png'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16.0),
          children:<Widget>[
            SizedBox(height: 50.0),
            logo,
            SizedBox(height: 100.0),
            UserLoginContainer(),
          ],
        ),
        ),
      );
  }
}
