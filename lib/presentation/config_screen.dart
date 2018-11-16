import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConfigState();
  }
}

class _ConfigState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Config sweet config!'),
    );
  }
}