import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../../data/models/nts_charts/chart_model.dart';
import 'package:sizer/sizer.dart';

class Charts extends StatelessWidget {
  final List<ChartModel> chartDataLIst;
  final String chartType;

  const Charts({Key key, this.chartDataLIst, this.chartType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var series = [
      charts.Series(
        domainFn: (ChartModel chartData, _) => chartData.type,
        measureFn: (ChartModel chartData, _) => chartData.value,
        colorFn: (ChartModel chartData, _) => getChartColors(chartData),
        id: 'Values',
        labelAccessorFn: (ChartModel row, _) => '${row.value}: ${row.type}',
        data: chartDataLIst,
      ),
    ];

    var chart = charts.PieChart(series,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: chartType == 'donut' ? 30 : 100,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));

    var chartWidget = Padding(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        height: 30.h,
        child: chart,
      ),
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          chartWidget,
        ],
      ),
    );
  }

  

  getChartColors(ChartModel model) {
    print(model.type.toLowerCase());
    switch (model.type.toLowerCase()) {
      case 'inprogress':
        return charts.ColorUtil.fromDartColor(Colors.amber.shade500);
        break;

      case 'complete':
        return charts.ColorUtil.fromDartColor(Colors.green.shade500);
        break;

      case 'completed':
        return charts.ColorUtil.fromDartColor(Colors.green.shade500);
        break;

      case 'cancel':
        return charts.ColorUtil.fromDartColor(Colors.red.shade500);
        break;

      case 'draft':
        return charts.ColorUtil.fromDartColor(Colors.grey);
        break;

      case 'requester':
        return charts.ColorUtil.fromDartColor(Colors.orange);
        break;

      case 'owner':
        return charts.ColorUtil.fromDartColor(Colors.blue.shade500);
        break;

      case 'shared':
        return charts.ColorUtil.fromDartColor(Colors.amber.shade300);
        break;

      case 'active':
        return charts.ColorUtil.fromDartColor(Colors.green.shade300);
        break;

      case 'expire':
        return charts.ColorUtil.fromDartColor(Colors.red.shade300);
        break;

      case 'reject':
        return charts.ColorUtil.fromDartColor(Colors.red.shade700);
        break;

      case 'overdue':
        return charts.ColorUtil.fromDartColor(Colors.orange);
        break;
    }
  }
}
