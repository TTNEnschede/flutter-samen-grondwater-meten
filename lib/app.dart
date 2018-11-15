import 'package:flutter/material.dart';
import 'package:simple_auth_flutter/simple_auth_flutter.dart';

import 'package:flutter_samen_grondwater_meten/constants.dart';
import 'package:flutter_samen_grondwater_meten/presentation/login_screen.dart';

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SimpleAuthFlutter.init(context);

    // Wrap the material app in a store provider so that the store is available
    // to every widget in the app.
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: LoginScreen(),
    );
  }
}

