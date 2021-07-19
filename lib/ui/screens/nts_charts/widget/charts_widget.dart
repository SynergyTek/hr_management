import 'package:flutter/material.dart';
import 'package:hr_management/data/models/nts_charts/chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatefulWidget {
  final List<ChartModel> chartDataLIst;
  final String chartType;
  final String nts;

  const Charts({Key key, this.chartDataLIst, this.chartType, this.nts})
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
                DoughnutSeries<ChartModel, String>(
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.top,
                      labelPosition: ChartDataLabelPosition.outside,
                      labelIntersectAction: LabelIntersectAction.none),
                  explode: false,
                  radius: '100',
                  explodeIndex: 1,
                  dataSource: widget.chartDataLIst,
                  xValueMapper: (ChartModel data, _) => data.type,
                  yValueMapper: (ChartModel data, _) => data.value,
                  enableSmartLabels: true,
                  dataLabelMapper: (ChartModel data, _) => '${data.value}',
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
                    PieSeries<ChartModel, String>(
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.top,
                          labelPosition: ChartDataLabelPosition.inside,
                          labelIntersectAction: LabelIntersectAction.none),
                      explode: false,
                      radius: '100',
                      explodeIndex: 1,
                      dataSource: widget.chartDataLIst,
                      xValueMapper: (ChartModel data, _) => data.type,
                      yValueMapper: (ChartModel data, _) => data.value,
                      enableSmartLabels: true,
                      dataLabelMapper: (ChartModel data, _) => '${data.value}',
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
                    LineSeries<ChartModel, String>(
                      dataSource: widget.chartDataLIst,
                      name: '${widget.nts} SLA',
                      xValueMapper: (ChartModel data, _) => data?.type,
                      yValueMapper: (ChartModel data, _) => data.actualSLA,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ),
                      enableTooltip: true,
                      markerSettings: MarkerSettings(isVisible: true),
                    ),
                    LineSeries<ChartModel, String>(
                      dataSource: widget.chartDataLIst,
                      name: 'Actual SLA',
                      xValueMapper: (ChartModel data, _) => data?.type,
                      yValueMapper: (ChartModel data, _) => data.days,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.top,
                          labelIntersectAction: LabelIntersectAction.none),
                      enableTooltip: true,
                      markerSettings: MarkerSettings(isVisible: true),
                    )
                  ]);
  }

  getChartColors(ChartModel model) {
    switch (model.type) {
      case 'Inprogress':
        return Colors.yellow.shade800;
        break;

      case 'Complete':
        return Colors.green.shade800;
        break;

      case 'Cancel':
        return Colors.red.shade800;
        break;

      case 'Draft':
        return Colors.grey;
        break;

      case "Close":
        return Colors.blue.shade800;
        break;

      case 'Requester':
        return Colors.yellow.shade800;
        break;

      case 'Owner':
        return Colors.blue.shade800;
        break;
    }
  }
}
