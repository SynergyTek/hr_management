import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeChartWidget extends StatelessWidget {
  final double gaugeValue;

  final Widget child;

  const GaugeChartWidget({
    @required this.gaugeValue,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SfRadialGauge(
              enableLoadingAnimation: true,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 100,
                      color: Theme.of(context).textHeadingColor,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: gaugeValue ?? 0.0,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Container(
                        child: Text(
                          "${gaugeValue ?? '0.0'}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          child ?? Container(),
        ],
      ),
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
