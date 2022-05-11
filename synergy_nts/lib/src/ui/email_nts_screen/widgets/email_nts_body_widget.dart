import 'package:flutter/material.dart';
import 'package:synergy_nts/src/bloc/email_bloc/email_bloc.dart';
import 'package:synergy_nts/src/models/email_model/email_model.dart';
import 'package:synergy_nts/src/models/email_model/email_response_model.dart';
import 'package:synergy_nts/src/theme/theme_config.dart';
import 'package:synergy_nts/src/ui/widgets/custom_progress_indicator.dart';
import 'package:synergy_nts/src/ui/widgets/empty_list_widget.dart';

class EmailNtsScreenBody extends StatefulWidget {
  const EmailNtsScreenBody({Key? key}) : super(key: key);

  @override
  State<EmailNtsScreenBody> createState() => _EmailNtsScreenBodyState();
}

class _EmailNtsScreenBodyState extends State<EmailNtsScreenBody> {
  List<EmailData>? list;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    emailBloc.getReadEmailData(queryparams: {
      "id": null, //TODO
      "refId": null, //TODO
      "refType": "NTS_Service",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: () => _handleRefreshOnClick(),
                child: const Text('Refresh')),
          ),
          Flexible(
            child: StreamBuilder<EmailResponseModel?>(
              stream: emailBloc.subjectEmailData.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<EmailResponseModel?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.mapdata == null ||
                      snapshot.data!.mapdata!.data!.isEmpty) {
                    return Center(
                      child: EmptyListWidget(),
                    );
                  }
                  list = snapshot.data?.mapdata?.data;
                  return ListView.builder(
                    itemCount: list?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        margin: DEFAULT_PADDING,
                        child: Container(
                          padding: DEFAULT_PADDING,
                          margin: DEFAULT_PADDING,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('bcc :${list?[index].bcc}'),
                              Text('body :${list?[index].body}'),
                              Text('cc :${list?[index].cc}'),
                              Text('from :${list?[index].from}'),
                              Text('fromUserId :${list?[index].fromUserId}'),
                              Text('subject :${list?[index].subject}'),
                              Text('to :${list?[index].to}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CustomProgressIndicator(loadingText: 'Please Wait'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _handleRefreshOnClick() {
    emailBloc.subjectEmailData.sink.add(null);
    apiCall();
  }
}
