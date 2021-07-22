import 'package:flutter/material.dart';
import 'package:hr_management/data/models/payslip/payslip_model.dart';
import 'package:hr_management/data/models/payslip/payslip_res_model.dart';
import 'package:hr_management/logic/blocs/payslip_bloc/payslip_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
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
            return Listizer(
              listItems: paySlipList,
              filteredSearchList: filterPaySlipList,
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
