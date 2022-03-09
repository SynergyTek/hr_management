import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWidget extends StatelessWidget {
  final List<PieSeries> series;

  final Widget? child;

  const PieChartWidget({
    required this.series,
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
            child: SfCircularChart(
              tooltipBehavior: TooltipBehavior(
                enable: true,
              ),
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
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
