import 'package:flutter/material.dart';
import 'package:hr_management/data/models/salary_info_model/salary_info_response.dart';
import 'package:hr_management/logic/blocs/salary_info_bloc/salary_info_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

class SalaryDetailsScreenBody extends StatefulWidget {
  SalaryDetailsScreenBody({Key? key}) : super(key: key);

  @override
  State<SalaryDetailsScreenBody> createState() =>
      _SalaryDetailsScreenBodyState();
}

class _SalaryDetailsScreenBodyState extends State<SalaryDetailsScreenBody> {
  List<SalaryInfoModel>? list;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    salaryInfoBloc.getSalaryInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<SalaryInfoResponse?>(
        stream: salaryInfoBloc.subjectSalaryInfo.stream,
        builder: (BuildContext context,
            AsyncSnapshot<SalaryInfoResponse?> snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data?.data;
            return ListView.builder(
              itemCount: list?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(list?[index].noteId ?? ''),
                );
              },
            );
          } else {
            return Center(child: CustomProgressIndicator());
          }
        },
      ),
    );
  }
}
