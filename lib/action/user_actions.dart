class UserLoginAction {
  final String username;

  UserLoginAction(this.username);

  @override
  String toString() {
    return 'UserLoginAction {username: $username}';
  }
}
class UserLogoutAction {}
