import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_samen_grondwater_meten/model/models.dart';

class UsernameContainer extends StatelessWidget {

  UsernameContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return (vm.username != null) ?
          Text('Hi ' + vm.username, style: new TextStyle(color: Colors.black.withOpacity(0.9)))
            : Text('');
      },
    );
  }
}

class _ViewModel {

  final String username;

  _ViewModel({
    @required this.username,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        username: (store.state.user != null) ? store.state.user.name : null,
    );
  }

  // The distinct parameter (StoreConnector) is set (as a performance
  // optimization) so the [==] operator and hashCode function need to be overridden.
  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              username == other.username;

  @override
  int get hashCode => username.hashCode;

}