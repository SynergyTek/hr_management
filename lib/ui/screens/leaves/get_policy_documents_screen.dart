import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/data/models/hr_policy_document_model/hr_policy_document_model.dart';
import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import '../../../constants/api_endpoints.dart';
import '../../../data/helpers/download_helper/downloader_screen/downloader.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/widgets.dart';

class HrPolicyDocumentScreen extends StatefulWidget {
  const HrPolicyDocumentScreen({Key? key}) : super(key: key);

  @override
  State<HrPolicyDocumentScreen> createState() => _HrPolicyDocumentScreenState();
}

class _HrPolicyDocumentScreenState extends State<HrPolicyDocumentScreen> {
  List<PolicyDocumentsModel>? list;

  String? _url;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    leaveBloc.getHrPolicyDocument(queryparams: {
      "userId":
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
      "portalName": BlocProvider.of<UserModelBloc>(context)
              .state
              .extraUserInformation
              ?.portalType ??
          "HR",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HR Policy Documents'),
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: StreamBuilder<HrPolicyDocumentResponse?>(
          stream: leaveBloc.subjectHrPolicyDocument.stream,
          builder: (BuildContext context,
              AsyncSnapshot<HrPolicyDocumentResponse?> snapshot) {
            if (snapshot.hasData) {
              list = snapshot.data?.data;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: list?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Container(
                      margin: DEFAULT_PADDING,
                      padding: DEFAULT_PADDING,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: titleWidget(
                                  context: context,
                                  caption: 'Policy Name:',
                                  title: (list?[index].policyName ?? ''),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                    child: Icon(Icons.remove_red_eye),
                                    onTap: () {
                                      print('object');
                                      _url = APIEndpointConstants
                                              .GET_ATTACHMENT_VIEW_WEBVIEW_URL +
                                          list![index].policyDocument!;
                                      showModalBottomSheet(
                                        context: context,
                                        isDismissible: true,
                                        isScrollControlled: false,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: true,
                                        builder: (BuildContext context) {
                                          return Downloader(
                                            filename: list![index].policyName!,
                                            url: _url!,
                                          );
                                        },
                                      );
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: subtitleWidget(
                                  context: context,
                                  caption: 'Description:',
                                  title: (list?[index].policyDescription ?? ''),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: subtitleWidget(
                                  context: context,
                                  caption: 'Released Date:',
                                  title: date(index),
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
      ),
    );
  }

  String date(int index) {
    if (list?[index].startDate != null &&
        list![index].startDate.toString().contains(" ")) {
      return list![index].startDate!.toString().split(" ")[0];
    } else {
      return list![index].startDate?.toString() ?? "-";
    }
  }
}
