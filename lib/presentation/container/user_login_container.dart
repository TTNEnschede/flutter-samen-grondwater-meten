import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_samen_grondwater_meten/authentication/keycloak_oauth_api.dart';
import 'package:flutter_samen_grondwater_meten/presentation/home_screen.dart';
import 'package:redux/redux.dart';

import 'package:flutter_samen_grondwater_meten/action/actions.dart';
import 'package:flutter_samen_grondwater_meten/model/models.dart';

class UserLoginContainer extends StatelessWidget {

  UserLoginContainer({Key key}) : super(key: key);

  // oAuth authenticator for logging in.
  final KeyCloakOAuthApi oAuthAuthenticator = KeyCloakOAuthApi();

  /// Opens an authentication dialog (if needed).
  /// When authenticated redirects the user to the home screen.
  void _login(context) async {
    try {
      // Authenticate user. Once logged in token is stored in secure storage
      // and refreshed for consecutive logins.
      var success = await oAuthAuthenticator.authenticate();
      print('Success: $success');

      // Go to home page after successful login.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return
          ButtonTheme(
            child: RaisedButton(
              onPressed: () {
                _login(context);
              },
              color: Colors.lightBlueAccent,
              child: Text('Log In', style: TextStyle(color: Colors.white)),
            ),
          );
      },
    );
  }
}

class _ViewModel {
  final onLoginPressed;

  _ViewModel({
    @required this.onLoginPressed,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        onLoginPressed: (username) {
          store.dispatch(UserLoginAction(username));
        }
    );
  }

  // The distinct parameter (StoreConnector) is set (as a performance
  // optimization) so the [==] operator and hashCode function need to be overridden.
  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              onLoginPressed == other.onLoginPressed;

  @override
  int get hashCode => onLoginPressed.hashCode;

}