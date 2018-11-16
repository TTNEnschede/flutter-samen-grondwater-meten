import 'package:redux/redux.dart';

import 'package:flutter_samen_grondwater_meten/action/actions.dart';
import 'package:flutter_samen_grondwater_meten/model/models.dart';

final tabReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) {
  return action.newTab;
}