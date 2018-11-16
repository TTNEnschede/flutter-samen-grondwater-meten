import 'package:flutter/material.dart';
import 'package:flutter_samen_grondwater_meten/presentation/times_series_bar.dart';

class ChartMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChartMainState();
  }
}

class _ChartMainState extends State<ChartMain> {
  @override
  Widget build(BuildContext context) {
    return
      Flexible(
          child:
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TimeSeriesBar.withSampleData(),
          )
      );
  }
}