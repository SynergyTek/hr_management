import 'package:flutter/material.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../../data/models/payslip/payslip_model.dart';
import '../../../../data/models/payslip/payslip_res_model.dart';
import '../../../../logic/blocs/payslip_bloc/payslip_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:listizer/listizer.dart';

class PayslipBody extends StatefulWidget {
  PayslipBody({Key key}) : super(key: key);

  @override
  _PayslipBodyState createState() => _PayslipBodyState();
}

class _PayslipBodyState extends State<PayslipBody> {
  List<PayslipModel> paySlipList = [];
  List<PayslipModel> filterPaySlipList = [];

  @override
  void initState() {
    payslipBloc.getManageAccrual(legalEntityId: '60d2df036755e8de168d8db7');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<PayslipResponse>(
        stream: payslipBloc.subjectPayslip.stream,
        builder: (context, AsyncSnapshot<PayslipResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }
            paySlipList = snapshot.data.data;
            if (paySlipList==null|| paySlipList.length == 0) {
              return EmptyListWidget();
            }
            return Listizer(
              listItems: paySlipList,
              filteredSearchList: filterPaySlipList,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      salaryName(index),
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Person Name: "),
                                  Text(personFullName(index)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                          child: Row(
                            children: <Widget>[
                              Text("Person No: "),
                              Text(
                                personNo(index),
                                style: TextStyle(color: Colors.deepPurple[900]),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text("Payroll Start Date: "),
                                  Text(
                                    payrollStartDate(index),
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
                                  Text("Payroll End Date: "),
                                  Text(
                                    payrollEndDate(index),
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
                                  Text("Total Earnings: "),
                                  Text(
                                    totalEarning(index),
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
                                  Text("Total Deduction: "),
                                  Text(
                                    totalDeduction(index),
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
                                  Text("Net Amount: "),
                                  Text(
                                    netAmount(index),
                                    style: TextStyle(
                                        color: Colors.deepPurple[900]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
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

  String salaryName(int index) {
    return paySlipList[index].salaryName ?? "-";
  }

  String personFullName(int index) {
    return paySlipList[index].personFullName ?? "-";
  }

  String personNo(int index) {
    return paySlipList[index].personNo ?? "-";
  }

  String payrollStartDate(int index) {
    return paySlipList[index].payrollStartDate ?? "-";
  }

  String payrollEndDate(int index) {
    return paySlipList[index].payrollEndDate ?? "-";
  }

  String totalEarning(int index) {
    return paySlipList[index].totalEarning ?? "-";
  }

  String totalDeduction(int index) {
    return paySlipList[index].totalDeduction ?? "-";
  }

  String netAmount(int index) {
    return paySlipList[index].netAmount ?? "-";
  }
}
