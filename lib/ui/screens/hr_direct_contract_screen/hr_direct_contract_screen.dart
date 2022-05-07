import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/hr_direct_contract_model/hr_direct_contract_model.dart';
import 'package:hr_management/logic/blocs/resignation_termination_bloc/resignation_termination_bloc.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

class HRDirectContractScreen extends StatefulWidget {
  HRDirectContractScreen({Key? key}) : super(key: key);

  @override
  State<HRDirectContractScreen> createState() => _HRDirectContractScreenState();
}

class _HRDirectContractScreenState extends State<HRDirectContractScreen> {
  HrDirectContractModel? hrDirectContractModel;

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  apiCall() {
    resignationTerminationBloc.getHrDirectContractList(
      queryparams: {
        "userId":
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
        "portalName": BlocProvider.of<UserModelBloc>(context)
                .state
                .extraUserInformation
                ?.portalType ??
            "HR",
        "personId": "129b167b-c1e9-4876-874b-015605071a8d",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HR Direct Contract"),
      ),
      body: StreamBuilder<HrDirectContractResponseModel?>(
        stream: resignationTerminationBloc.subjectHrDirectContract.stream,
        builder: (BuildContext context,
            AsyncSnapshot<HrDirectContractResponseModel?> snapshot) {
          if (snapshot.hasData) {
            hrDirectContractModel = snapshot.data?.mapdata;

            return Container(
              margin: DEFAULT_LARGE_PADDING,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contract',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          ADD_EDIT_NOTE_ROUTE,
                          arguments: ScreenArguments(
                              arg2: hrDirectContractModel?.noteId,
                              arg1: "",
                              arg3: "",
                              val1: false),
                        ),
                        child: Text('Manage Contract'),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      padding: DEFAULT_PADDING,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichTextWidget(
                                boldText: 'ContractType :',
                                normalText:
                                    hrDirectContractModel?.contractType ?? '',
                              ),
                              RichTextWidget(
                                boldText: 'Sponsor :',
                                normalText:
                                    hrDirectContractModel?.sponsorName ?? '',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichTextWidget(
                                boldText: 'AnnualLeaveEntitlement :',
                                normalText: hrDirectContractModel
                                        ?.annualLeaveEntitlement ??
                                    '',
                              ),
                              RichTextWidget(
                                boldText: 'ContractRenewable  :',
                                normalText:
                                    hrDirectContractModel?.contractRenewable ??
                                        '',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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

class RichTextWidget extends StatelessWidget {
  final String boldText;
  final String normalText;

  const RichTextWidget({
    Key? key,
    required this.boldText,
    required this.normalText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: boldText,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 10.sp,
              ),
            ),
            TextSpan(
              text: '\t$normalText',
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
