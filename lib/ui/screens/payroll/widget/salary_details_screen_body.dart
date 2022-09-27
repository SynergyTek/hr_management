import 'package:flutter/material.dart';
import 'package:hr_management/data/models/salary_info_model/salary_info_response.dart';
import 'package:hr_management/logic/blocs/salary_info_bloc/salary_info_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import 'edit_salary_screen.dart';

class SalaryDetailsScreenBody extends StatefulWidget {
  SalaryDetailsScreenBody({Key? key}) : super(key: key);

  @override
  State<SalaryDetailsScreenBody> createState() =>
      _SalaryDetailsScreenBodyState();
}

class _SalaryDetailsScreenBodyState extends State<SalaryDetailsScreenBody> {
  List<SalaryInfoModel>? list;

  bool switch0 = false;
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = false;
  bool switch5 = false;
  bool switch6 = false;
  bool switch7 = false;

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
    return Scaffold(
      body: Container(
        padding: DEFAULT_PADDING,
        margin: DEFAULT_PADDING,
        child: StreamBuilder<SalaryInfoResponse?>(
          stream: salaryInfoBloc.subjectSalaryInfo.stream,
          builder: (BuildContext context,
              AsyncSnapshot<SalaryInfoResponse?> snapshot) {
            if (snapshot.hasData) {
              list = snapshot.data?.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Switch(
                        value: switch0,
                        onChanged: (value) {
                          setState(() {
                            switch0 = value;
                          });
                        },
                      ),
                      Flexible(child: Text('TakeAttendanceFromTAA')),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: switch1,
                        onChanged: (value) {
                          setState(() {
                            switch1 = value;
                          });
                        },
                      ),
                      Flexible(
                          child: Text('IsEmployeeEligibleForEndOfService')),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: switch2,
                        onChanged: (value) {
                          setState(() {
                            switch2 = value;
                          });
                        },
                      ),
                      Flexible(
                        child: Text(
                            'IsEmployeeEligibleForFlightTicketsForDependants'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: switch3,
                        onChanged: (value) {
                          setState(() {
                            switch3 = value;
                          });
                        },
                      ),
                      Flexible(
                          child: Text('IsValidateDependentDocumentForBenefit')),
                    ],
                  ),
                  //
                  Row(
                    children: [
                      Switch(
                        value: switch4,
                        onChanged: (value) {
                          setState(() {
                            switch4 = value;
                          });
                        },
                      ),
                      Flexible(child: Text('IsEmployeeEligibleForOvertime')),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: switch5,
                        onChanged: (value) {
                          setState(() {
                            switch5 = value;
                          });
                        },
                      ),
                      Flexible(
                          child: Text(
                              'IsEmployeeEligibleForFlightTicketsForSelf')),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: switch6,
                        onChanged: (value) {
                          setState(() {
                            switch6 = value;
                          });
                        },
                      ),
                      Flexible(
                          child:
                              Text('DisableFlightTicketProcessingInPayroll')),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: switch7,
                        onChanged: (value) {
                          setState(() {
                            switch7 = value;
                          });
                        },
                      ),
                      Flexible(
                          child: Text('IsEligibleForSalaryTransferLetter')),
                    ],
                  ),
                  //
                  Container(
                    padding: DEFAULT_PADDING,
                    margin: DEFAULT_PADDING,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldWidget(text: 'FlightTicketFrequency'),
                        TextBoldWidget(text: 'PaymentMode'),
                        TextBoldWidget(text: 'BankAccountNumber'),
                        TextBoldWidget(text: 'UnpaidLeavesNotInSystem'),
                        TextBoldWidget(text: 'OvertimePaymentType'),
                        TextBoldWidget(text: 'BankBranch'),
                        TextBoldWidget(text: 'BankIbanNumber'),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CustomProgressIndicator());
            }
          },
        ),
      ),
      bottomSheet: PrimaryButton(
          backgroundColor: Theme.of(context).primaryColor,
          handleOnPressed: () => _handleEditOnClick(),
          buttonText: 'Edit'),
    );
  }

  _handleEditOnClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditSalaryInfoScreen(),
      ),
    );
  }
}

class TextBoldWidget extends StatelessWidget {
  const TextBoldWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
