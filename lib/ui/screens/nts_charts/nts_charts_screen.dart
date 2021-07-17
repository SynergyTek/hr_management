import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/nts_charts/chart_model.dart';
import 'package:hr_management/data/models/nts_charts/nts_charts_response.dart';
import 'package:hr_management/logic/blocs/nts_charts_bloc/nts_charts_bloc.dart';
import 'package:hr_management/ui/screens/nts_charts/widget/charts_widget.dart';
import 'package:sizer/sizer.dart';

class NTSChart extends StatefulWidget {
  final NTSType ntsType;
  const NTSChart({Key key, this.ntsType}) : super(key: key);

  @override
  _NTSChartState createState() => _NTSChartState();
}

class _NTSChartState extends State<NTSChart> {
  List<ChartModel> chartByStatus = [];
  List<ChartModel> chartUserType = [];
  String chartTitle = '';

  @override
  void initState() {
    chartTitle = widget.ntsType == NTSType.service
        ? 'Service'
        : widget.ntsType == NTSType.note
            ? 'Note'
            : 'Task';
    ntsChartBloc..getChartByStatus(ntsType: widget.ntsType);
    ntsChartBloc..getChartByUserType(ntsType: widget.ntsType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          chartCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 5.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.green.shade200,
                  child: Text(
                    '$chartTitle Status',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                StreamBuilder<ChartResponse>(
                    stream: ntsChartBloc.subjectChartByStatus.stream,
                    builder: (context, AsyncSnapshot<ChartResponse> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.list == null ||
                            snapshot.data.list.length == 0) {
                          return Container();
                        }
                        chartByStatus = snapshot.data.list;
                        return Charts(
                          chartDataLIst: chartByStatus,
                          chartType: 'donut',
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          ),
          chartCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 5.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.blue.shade200,
                  child: Text(
                    '$chartTitle Owned/Requested/Shared',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                StreamBuilder<ChartResponse>(
                    stream: ntsChartBloc.subjectChartByUserType.stream,
                    builder: (context, AsyncSnapshot<ChartResponse> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.list == null ||
                            snapshot.data.list.length == 0) {
                          return Container();
                        }
                        chartUserType = snapshot.data.list;
                        return Charts(
                          chartDataLIst: chartUserType,
                          chartType: 'pie',
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget chartCard({Widget child}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
        child: Card(
          elevation: 6,
          child: child,
        ));
  }
}
