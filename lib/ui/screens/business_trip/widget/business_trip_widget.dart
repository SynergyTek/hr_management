import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/data/models/business_trip_model/business_trip_model.dart';
import 'package:hr_management/data/models/business_trip_model/business_trip_response_model.dart';
import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import '../../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../widgets/widgets.dart';

class BusinessTripBody extends StatefulWidget {
  BusinessTripBody({Key? key}) : super(key: key);

  @override
  State<BusinessTripBody> createState() => _BusinessTripBodyState();
}

class _BusinessTripBodyState extends State<BusinessTripBody> {
  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    // leaveBloc.subjectBusinessTripList.sink.add(null);

    Map<String, dynamic> queryparams = Map();
    queryparams['userId'] =
        BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '';

    queryparams['portalName'] = "HR";

    leaveBloc
      ..getBusinessTripDetails(
        queryparams: queryparams,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<BusinessTripResponse>(
          stream: leaveBloc.subjectBusinessTripList.stream,
          builder: (context, AsyncSnapshot snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }
              var list = snapshot.data.data;
              List<BusinessTripModel> model = list.toList();

              return ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CREATE_SERVICE_ROUTE,
                            arguments: ScreenArguments(
                              arg1: "",
                              arg2: model[index].id,
                              arg3: "",
                              val1: false,
                            ),
                          );
                        },
                        leading: Icon(Icons.business_center_rounded),
                        trailing: Text(
                          model[index].status ?? "-",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Container(
                          padding: DEFAULT_VERTICAL_PADDING,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Purpose - " +
                                  (model[index].purpose ?? "NA")),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Start Date"),
                                  Text(" - "),
                                  Text("End Date"),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(formatDate(
                                          date: model[index]
                                              .businessTripStartDate) ??
                                      "NA"),
                                  Text(" - "),
                                  Text(formatDate(
                                          date: model[index]
                                              .businessTripEndDate) ??
                                      "NA")
                                ],
                              ),
                              Divider(color: Colors.black)
                            ],
                          ),
                        ));
                  });
            } else {
              return Center(
                child: CustomProgressIndicator(),
              );
            }
          }),
    );
  }
}
