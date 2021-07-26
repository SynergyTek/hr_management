import 'package:flutter/material.dart';
import '../../../../data/models/manage_accural/manage_accrual_model.dart';
import '../../../../data/models/manage_accural/manage_accrual_res_model.dart';
import '../../../../logic/blocs/manage_accrual_bloc/manage_accrual_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class ManageAccrualBody extends StatefulWidget {
  const ManageAccrualBody({Key key}) : super(key: key);

  @override
  _ManageAccrualBodyState createState() => _ManageAccrualBodyState();
}

class _ManageAccrualBodyState extends State<ManageAccrualBody> {
  List<ManageAccrualModel> manageAccrualList = [];
  List<ManageAccrualModel> filterAccrualList = [];

  @override
  void initState() {
    manageAccrualBloc.getManageAccrual();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<ManageAccrualResponse>(
        stream: manageAccrualBloc.subjectManageAccrual.stream,
        builder: (context, AsyncSnapshot<ManageAccrualResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            manageAccrualList = snapshot.data.data;
            return Listizer(
              listItems: manageAccrualList,
              filteredSearchList: filterAccrualList,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Row(
                        children: [
                          Text("Accrual Date: "),
                          Text(
                            accrualDate(index),
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      subtitle: Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text("EOS Accrual: "),
                                  Text(
                                    eosAccrual(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text("Flight Ticket Accrual: "),
                                  Text(
                                    flightTicketAccrual(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text("Vacation Accrual: "),
                                  Text(
                                    vacationAccrual(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text("Sick Leave Accrual: "),
                                  Text(
                                    sickLeaveAccrual(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text("Loan Accrual: "),
                                  Text(
                                    loanAccrual(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                    ));
              },
            );
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  String description(int index) {
    return manageAccrualList[index].description ?? "-";
  }

  String accrualDate(int index) {
    return manageAccrualList[index].yearMonthText ?? "-";
  }

  String eosAccrual(int index) {
    return manageAccrualList[index].eosAccrualText ?? "-";
  }

  String flightTicketAccrual(int index) {
    return manageAccrualList[index].flightTicketAccrualText ?? "-";
  }

  String vacationAccrual(int index) {
    return manageAccrualList[index].vacationAccrualText ?? "-";
  }

  String sickLeaveAccrual(int index) {
    return manageAccrualList[index].sickLeaveAccrualText ?? "-";
  }

  String loanAccrual(int index) {
    return manageAccrualList[index].loanAccrualText ?? "-";
  }
}
