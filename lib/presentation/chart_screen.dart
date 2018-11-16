import 'package:flutter/material.dart';

import 'package:flutter_samen_grondwater_meten/presentation/chart_filter.dart';
import 'package:flutter_samen_grondwater_meten/presentation/chart_main.dart';

class ChartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChartState();
  }
}

class _ChartState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ChartMain(),
        ChartFilter(),
      ],
    );
  }
}