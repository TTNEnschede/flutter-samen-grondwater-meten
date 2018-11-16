import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_samen_grondwater_meten/action/actions.dart';
import 'package:flutter_samen_grondwater_meten/model/models.dart';

class BottomNavigationContainer extends StatelessWidget {

  BottomNavigationContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return BottomNavigationBar(
          currentIndex: AppTab.values.indexOf(vm.activeTab),
          onTap: vm.onTabSelected,
          items: AppTab.values.map( (tab) {
            return BottomNavigationBarItem(
                icon: Icon(AppTabIcons[tab]),
                title: Text(_capitalize(tab.toString().split('.')[1])));
          }).toList(),
        );
      },
    );
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}

class _ViewModel {

  final AppTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeTab,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeTab: store.state.activeTab,
      onTabSelected: (index) {
        print('Tabbing sally: $index');
        store.dispatch(UpdateTabAction((AppTab.values[index])));
      },
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