import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_samen_grondwater_meten/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:simple_auth_flutter/simple_auth_flutter.dart';

import 'package:flutter_samen_grondwater_meten/constants.dart';
import 'package:flutter_samen_grondwater_meten/presentation/login_screen.dart';
import 'package:flutter_samen_grondwater_meten/reducers/app_reducers.dart';

class App extends StatelessWidget {

  // Create the store containing the app state, reducers and middleware.
  final store = Store<AppState>(
    appReducers,
    initialState: AppState.initial(),
    middleware: [],
  );


  @override
  Widget build(BuildContext context) {
    SimpleAuthFlutter.init(context);

    // Wrap the material app in a store provider so that the store is available
    // to every widget in the app.
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: Constants.appTitle,
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: LoginScreen(),
      )
    );
  }
}

