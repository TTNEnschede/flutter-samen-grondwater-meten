import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChartState();
  }
}

class _ChartState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Chart sweet chart!'),
    );
  }
}