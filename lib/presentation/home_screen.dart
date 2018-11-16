import 'package:flutter/material.dart';

import 'package:flutter_samen_grondwater_meten/presentation/container/bottom_nav_container.dart';
import 'package:flutter_samen_grondwater_meten/presentation/container/home_body_container.dart';
import 'package:flutter_samen_grondwater_meten/presentation/container/user_logout_container.dart';
import 'package:flutter_samen_grondwater_meten/presentation/container/username_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            centerTitle: false,
            elevation: 0.0,
            bottom: AppBar( // Wrapping the AppBar in the bottom for top padding
              title: UsernameContainer(),
              actions: [
                UserLogoutContainer(),
              ],
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              centerTitle: false,
              elevation: 0.0,
            ),
          )
      ),
      body: Center(
        child: HomeBodyContainer(),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Color(0xFF3CABFC),
        ),
        child: BottomNavigationContainer(),
      ),
      backgroundColor: Colors.white,
    );
  }
}