import 'package:flutter_samen_grondwater_meten/model/app_state.dart';
import 'package:flutter_samen_grondwater_meten/reducers/user_reducer.dart';
import 'package:flutter_samen_grondwater_meten/reducers/tab_reducer.dart';

AppState appReducers(AppState state, action) {
  return AppState(
    activeTab: tabReducer(state.activeTab, action),
    user: userReducer(state.user, action),
  );
}