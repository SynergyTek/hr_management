import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GaugeChartWidget extends StatelessWidget {
  const GaugeChartWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class BarChartWidget extends StatefulWidget {
  final double axisCrossesAt;
  final Function xValueMapper;
  final Function yValueMapper;
  final int dataCount;

  const BarChartWidget({
    @required this.axisCrossesAt,
    @required this.xValueMapper,
    @required this.yValueMapper,
    @required this.dataCount,
  });
  @override
  _BarChartWidgetState createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SfSparkBarChart.custom(
      axisCrossesAt: widget.axisCrossesAt,
      xValueMapper: widget.xValueMapper,
      yValueMapper: widget.yValueMapper,
      dataCount: widget.dataCount,
    );
  }
}
