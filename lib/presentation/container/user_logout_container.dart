import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_samen_grondwater_meten/action/actions.dart';
import 'package:flutter_samen_grondwater_meten/model/models.dart';

class UserLogoutContainer extends StatelessWidget {

  UserLogoutContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return
          new Opacity(
            opacity: vm.visible ? 1.0 : 0.0,
            child: IconButton(
                icon: new Icon(Icons.exit_to_app),
                color: Colors.black.withOpacity(0.9),
                onPressed: () {
                  if (vm.visible) {
                    vm.onLogoutPressed();
                    Navigator.pop(context);
                  }
                }
            ),
          );
      },
    );
  }
}

class _ViewModel {

  final bool visible;
  final onLogoutPressed;

  _ViewModel({
    @required this.visible,
    @required this.onLogoutPressed,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        visible: store.state.user != null,
        onLogoutPressed: () {
          store.dispatch(UserLogoutAction());
        }
    );
  }

  // The distinct parameter (StoreConnector) is set (as a performance
  // optimization) so the [==] operator and hashCode function need to be overridden.
  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              onLogoutPressed == other.onLogoutPressed;

  @override
  int get hashCode => onLogoutPressed.hashCode;

}