import 'package:flutter/material.dart';

class ChartFilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChartFilterState();
  }
}

class _ChartFilterState extends State<ChartFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Dag'),
              Text('Week',
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.9),
                      fontWeight: FontWeight.bold
                  )),
              Text('Maand'),
              Text('Jaar'),
              Text('Alles'),
            ],
          )
        ),
    ]);
  }
}