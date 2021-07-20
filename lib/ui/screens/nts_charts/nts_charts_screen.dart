import 'package:flutter/material.dart';
import 'package:hr_management/constants/formats.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/nts_charts/chart_model.dart';
import 'package:hr_management/data/models/nts_charts/nts_charts_response.dart';
import 'package:hr_management/logic/blocs/nts_charts_bloc/nts_charts_bloc.dart';
import 'package:hr_management/ui/screens/nts_charts/widget/charts_widget.dart';
import 'package:hr_management/ui/widgets/nts_widgets.dart';
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
  DateTime fromDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month - 1, DateTime.now().day);
  DateTime toDate = DateTime.now();

  @override
  void initState() {
    chartTitle = widget.ntsType == NTSType.service
        ? 'Service'
        : widget.ntsType == NTSType.note
            ? 'Note'
            : 'Task';
    ntsChartBloc..getChartByStatus(ntsType: widget.ntsType);
    ntsChartBloc..getChartByUserType(ntsType: widget.ntsType);
    ntsChartBloc..getDatewiseSLA(ntsType: widget.ntsType);

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
                  height: 4.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.green.shade200,
                  child: Text(
                    '$chartTitle Status',
                    style: TextStyle(fontSize: 14),
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
                  height: 4.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.blue.shade200,
                  child: Text(
                    '$chartTitle Owned/Requested/Shared',
                    style: TextStyle(fontSize: 14),
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
          chartCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.amber.shade200,
                  child: Text(
                    '$chartTitle SLA',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: DynamicDateTimeBox(
                        code: fromDate?.toString() ?? null,
                        name: 'From',
                        key: new Key('Start Date'),
                        selectDate: (DateTime date) {
                          if (date != null) {
                            setState(() {
                              fromDate = date;
                            });
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: DynamicDateTimeBox(
                        code: toDate?.toString() ?? null,
                        name: 'To',
                        key: new Key('End Date'),
                        selectDate: (DateTime date) {
                          if (date != null) {
                            setState(() {
                              toDate = date;
                            });
                            print(dateformatterWithSlash.format(toDate));
                          }
                        },
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.save),
                      onPressed: () {
                        ntsChartBloc.subjectDatewiseSLA.sink.add(null);
                        Map<String, dynamic> queryparams = Map();
                        queryparams["startDate"] =
                            dateformatterWithSlash.format(fromDate) ?? '';
                        queryparams["dueDate"] =
                            dateformatterWithSlash.format(toDate) ?? '';
                        ntsChartBloc
                          ..getDatewiseSLA(
                              ntsType: widget.ntsType,
                              queryparams: queryparams);
                      },
                    )
                  ],
                ),
                StreamBuilder<ChartResponse>(
                    stream: ntsChartBloc.subjectDatewiseSLA.stream,
                    builder: (context, AsyncSnapshot<ChartResponse> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.list == null ||
                            snapshot.data.list.length == 0) {
                          return Container();
                        }
                        chartUserType = snapshot.data.list;
                        return Container(
                          height: 50.h,
                          child: Charts(
                            chartDataLIst: chartUserType,
                            chartType: 'line',
                            nts: chartTitle,
                          ),
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
        margin: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 1.w),
        child: Card(
          elevation: 6,
          child: child,
        ));
  }
}
