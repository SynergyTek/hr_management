import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'dart:math' as math;

class GaugeChartWidget extends StatelessWidget {
  final List<double> gaugeValueList;

  final Widget? child;

  const GaugeChartWidget({
    required this.gaugeValueList,
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
                  pointers: _pointerListWidget(),
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Container(
                        child: Text(
                          "$gaugeValueList ",
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

  List<GaugePointer> _pointerListWidget() {
    List<GaugePointer> _pointers = [];

    gaugeValueList.forEach((element) {
      _pointers
        ..add(
          NeedlePointer(
            enableAnimation: true,
            needleColor: Color(
              (math.Random().nextDouble() * 0xFFFFFF).toInt(),
            ).withOpacity(1.0),
            value: element ,
          ),
        );
    });

    return _pointers;
  }
}

