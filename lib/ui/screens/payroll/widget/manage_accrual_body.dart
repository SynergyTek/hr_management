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
                    title: Text(
                      noteSubject(index),
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
                                  Text("Note No: "),
                                  Text(noteNoValue(index)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                          child: Row(
                            children: <Widget>[
                              Text("From: "),
                              Text(
                                ownerUserName(index),
                                style: TextStyle(color: Colors.deepPurple[900]),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                noteStatusName(index),
                                style: TextStyle(color: Colors.green[800]),
                              ),
                            ),
                            // Text(
                            //   expiryDate(index),
                            //   style: TextStyle(color: Colors.red[700]),
                            // ),
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

  String noteSubject(int index) {
    return manageAccrualList[index].noteSubject ?? "-";
  }

  String noteNoValue(int index) {
    return manageAccrualList[index].noteNo ?? "-";
  }

  String ownerUserName(int index) {
    return manageAccrualList[index].ownerUserName ?? "-";
  }

  // String assigneeDisplayName(int index) {
  //   return manageAccrualList[index].assigneeDisplayName ?? "-";
  // }

  String noteStatusName(int index) {
    return manageAccrualList[index].noteStatusName ?? "-";
  }

  // String expiryDate(int index) {
  //   return noteList[index].expiryDateDisplay ?? "-";
  // }
}
