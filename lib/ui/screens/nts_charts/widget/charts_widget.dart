import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Charts extends StatefulWidget {
  final List? chartDataLIst;
  final String? chartType;
  final String? nts;

  const Charts({Key? key, this.chartDataLIst, this.chartType, this.nts})
      : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    TooltipBehavior _tooltipBehavior = TooltipBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        canShowMarker: true);
    return widget.chartType == 'donut'
        ? SfCircularChart(
            legend: Legend(
                isVisible: true,
                alignment: ChartAlignment.center,
                overflowMode: LegendItemOverflowMode.wrap,
                position: LegendPosition.bottom),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
                DoughnutSeries<dynamic, String>(
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.top,
                      labelPosition: ChartDataLabelPosition.outside,
                      labelIntersectAction: LabelIntersectAction.none),
                  explode: false,
                  radius: '100',
                  explodeIndex: 1,
                  dataSource: widget.chartDataLIst,
                  xValueMapper: (dynamic data, _) => data.type,
                  yValueMapper: (dynamic data, _) => data.value,
                  // enableSmartLabels: true,/// TODO Commented due to package incompatability issues
                  dataLabelMapper: (dynamic data, _) => '${data.value}',
                )
              ])
        : widget.chartType == 'pie'
            ? SfCircularChart(
                legend: Legend(
                    isVisible: true,
                    alignment: ChartAlignment.center,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom),
                series: <CircularSeries>[
                    PieSeries<dynamic, String>(
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.top,
                          labelPosition: ChartDataLabelPosition.inside,
                          labelIntersectAction: LabelIntersectAction.none),
                      explode: false,
                      radius: '100',
                      explodeIndex: 1,
                      dataSource: widget.chartDataLIst,
                      xValueMapper: (dynamic data, _) => data.type,
                      yValueMapper: (dynamic data, _) => data.value,
                      // enableSmartLabels: true, /// TODO Commented due to package incompatability issues
                      dataLabelMapper: (dynamic data, _) => '${data.value}',
                    )
                  ])
            : SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  labelRotation: 90,
                ),
                legend: Legend(
                    isVisible: true,
                    alignment: ChartAlignment.center,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom),
                series: <ChartSeries>[
                    LineSeries<dynamic, String>(
                      dataSource: widget.chartDataLIst!,
                      name: '${widget.nts} SLA',
                      xValueMapper: (dynamic data, _) => data.type,
                      yValueMapper: (dynamic data, _) => data.actualSLA,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ),
                      enableTooltip: true,
                      markerSettings: MarkerSettings(isVisible: true),
                    ),
                    LineSeries<dynamic, String>(
                      dataSource: widget.chartDataLIst!,
                      name: 'Actual SLA',
                      xValueMapper: (dynamic data, _) => data.type,
                      yValueMapper: (dynamic data, _) => data.days,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.top,
                          labelIntersectAction: LabelIntersectAction.none),
                      enableTooltip: true,
                      markerSettings: MarkerSettings(isVisible: true),
                    )
                  ]);
  }

  // getChartColors(ChartModel model) {
  //   switch (model.type) {
  //     case 'Inprogress':
  //       return Colors.yellow.shade800;
  //       break;

  //     case 'Complete':
  //       return Colors.green.shade800;
  //       break;

  //     case 'Cancel':
  //       return Colors.red.shade800;
  //       break;

  //     case 'Draft':
  //       return Colors.grey;
  //       break;

  //     case "Close":
  //       return Colors.blue.shade800;
  //       break;

  //     case 'Requester':
  //       return Colors.yellow.shade800;
  //       break;

  //     case 'Owner':
  //       return Colors.blue.shade800;
  //       break;

  //     case 'shared':
  //       return charts.ColorUtil.fromDartColor(Colors.amber.shade300);
  //       break;

  //     case 'active':
  //       return charts.ColorUtil.fromDartColor(Colors.green.shade300);
  //       break;

  //     case 'expire':
  //       return charts.ColorUtil.fromDartColor(Colors.red.shade300);
  //       break;

  //     case 'reject':
  //       return charts.ColorUtil.fromDartColor(Colors.red.shade700);
  //       break;

  //     case 'overdue':
  //       return charts.ColorUtil.fromDartColor(Colors.orange);
  //       break;
  //   }
  // }
}
