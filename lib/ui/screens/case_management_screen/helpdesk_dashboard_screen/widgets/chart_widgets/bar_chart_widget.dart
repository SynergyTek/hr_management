import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartWidget extends StatelessWidget {
  final List<BarSeries> series;

  final Widget child;

  const BarChartWidget({
    @required this.series,
    this.child,
  }) : assert(series != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SfCartesianChart(
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              series: series,
            ),
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}
