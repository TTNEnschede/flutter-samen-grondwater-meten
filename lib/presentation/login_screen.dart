import 'package:flutter/material.dart';
import 'package:flutter_samen_grondwater_meten/authentication/keycloak_oauth_api.dart';
import 'package:flutter_samen_grondwater_meten/presentation/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  // oAuth authenticator for logging in.
  KeyCloakOAuthApi oAuthAuthenticator;

  void initState() {
    super.initState();

    // Initalize the authenticator.
    oAuthAuthenticator = KeyCloakOAuthApi();
  }

  void _login() async {
    try {
      // Authenticate user. Once logged in token is stored in secure storage
      // and refreshed for consecutive logins.
      var success = await oAuthAuthenticator.authenticate();

      // Go to home page after successful login.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print(e);
    }
  }

  void _logout() async {
    await oAuthAuthenticator.logOut();
    print("Logged out");
  }

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
            ButtonTheme(
              child: RaisedButton(
                onPressed: () {
                  _login();
                },
                color: Colors.lightBlueAccent,
                child: Text('Log In', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
        ),
      );
  }
}
