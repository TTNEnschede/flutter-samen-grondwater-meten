import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TimeSeriesBar extends StatelessWidget {
  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
  final bool animate;

  TimeSeriesBar(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeSeriesBar.withSampleData() {
    return new TimeSeriesBar(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Set the default renderer to a bar renderer.
      // This can also be one of the custom renderers of the time series chart.
      defaultRenderer: new charts.BarRendererConfig<DateTime>(),
      // Indicate that this time axis is being used with a bar renderer.
      domainAxis: new charts.DateTimeAxisSpec(usingBarRenderer: true),
      // It is recommended that default interactions be turned off if using bar
      // renderer, because the line point highlighter is the default for time
      // series chart.
      defaultInteractions: false,
      // If default interactions were removed, optionally add select nearest
      // and the domain highlighter that are typical for bar charts.
      behaviors: [
        new charts.SelectNearest(),
        new charts.DomainHighlighter(),
        new charts.ChartTitle('Grondwaterstand',
          subTitle: '',
          behaviorPosition: charts.BehaviorPosition.top,
          titleOutsideJustification: charts.OutsideJustification.start,
          // Set a larger inner padding than the default (10) to avoid
          // rendering the text too close to the top measure axis tick label.
          // The top tick label may extend upwards into the top margin region
          // if it is located at the top of the draw area.
          innerPadding: 24)],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2018, 10, 26), 5),
      new TimeSeriesSales(new DateTime(2018, 10, 27), 5),
      new TimeSeriesSales(new DateTime(2018, 10, 28), 25),
      new TimeSeriesSales(new DateTime(2018, 10, 29), 100),
      new TimeSeriesSales(new DateTime(2018, 10, 30), 75),
      new TimeSeriesSales(new DateTime(2018, 10, 31), 88),
      new TimeSeriesSales(new DateTime(2018, 11, 1), 65),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}