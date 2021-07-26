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
  List<ManageAccrualDatum> manageAccrualList = [];
  List<ManageAccrualDatum> filterAccrualList = [];

  @override
  void initState() {
    manageAccrualBloc.getManageAccrual(
       );
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
            manageAccrualList = snapshot.data.data.data;
            return Listizer(
              listItems: manageAccrualList,
              filteredSearchList: filterAccrualList,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(),
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
}
