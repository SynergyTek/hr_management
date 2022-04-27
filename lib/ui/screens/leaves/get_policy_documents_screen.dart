import 'package:flutter/material.dart';
import 'package:hr_management/data/models/hr_policy_document_model/hr_policy_document_model.dart';
import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/api_endpoints.dart';

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
      "userId": "45bba746-3309-49b7-9c03-b5793369d73c",
      "portalName": "HR",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hr Policy Documents'),
      ),
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
                    margin: DEFAULT_PADDING,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Container(
                      margin: DEFAULT_PADDING,
                      padding: DEFAULT_PADDING,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Policy Name:\t\t' +
                                    (list?[index].policyName ?? ''),
                              ),
                              Text(
                                'Description:\t\t' +
                                    (list?[index].policyDescription ?? ''),
                              ),
                              Text('Released Date:\t\t' +
                                  (list?[index].startDate.toString()
                                      as String)),
                            ],
                          ),
                          Container(
                            child: Column(
                              children: [
                                GestureDetector(
                                    child: Icon(Icons.remove_red_eye),
                                    onTap: () {
                                      print('object');
                                      _url = APIEndpointConstants
                                              .GET_ATTACHMENT_VIEW_WEBVIEW_URL +
                                          list![index].policyDocument!;
                                      _launchURL();
                                    }),
                              ],
                            ),
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

  void _launchURL() async {
    if (!await launch(_url ?? '')) throw 'Could not launch $_url';
  }
}
