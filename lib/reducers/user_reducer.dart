import 'package:redux/redux.dart';

import 'package:flutter_samen_grondwater_meten/model/models.dart';
import 'package:flutter_samen_grondwater_meten/action/user_actions.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, UserLoginAction>(_setUserLogin),
  TypedReducer<User, UserLogoutAction>(_setUserLogout),
]);

User _setUserLogin(User state, UserLoginAction action) {
  return new User(action.username);
}

User _setUserLogout(User state, action) {
  return null;
}

