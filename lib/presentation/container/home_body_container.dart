import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_samen_grondwater_meten/model/models.dart';
import 'package:flutter_samen_grondwater_meten/presentation/chart_screen.dart';
import 'package:flutter_samen_grondwater_meten/presentation/config_screen.dart';
import 'package:flutter_samen_grondwater_meten/presentation/info_screen.dart';

class HomeBodyContainer extends StatelessWidget {

  HomeBodyContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Widget _screen;
        switch (vm.activeTab) {
          case AppTab.info:
            _screen = InfoScreen();
            break;
          case AppTab.overzicht:
            _screen = ChartScreen();
            break;
          case AppTab.configuratie:
            _screen = ConfigScreen();
            break;
          default:
            _screen = Center(child: Text('Unknown screen'));
            break;
        }
        return _screen;
      },
    );
  }

}

class _ViewModel {

  final AppTab activeTab;

  _ViewModel({
    @required this.activeTab,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeTab: store.state.activeTab,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab;

  @override
  int get hashCode => activeTab.hashCode;

}