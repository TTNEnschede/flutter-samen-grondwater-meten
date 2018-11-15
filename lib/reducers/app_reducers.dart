import 'package:flutter_samen_grondwater_meten/model/app_state.dart';
import 'package:flutter_samen_grondwater_meten/reducers/user_reducer.dart';

AppState appReducers(AppState state, action) {
  return AppState(
    user: userReducer(state.user, action),
  );
}