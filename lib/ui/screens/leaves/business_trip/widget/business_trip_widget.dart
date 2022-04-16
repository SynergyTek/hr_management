import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/data/models/business_trip_model/business_trip_model.dart';
import 'package:hr_management/data/models/business_trip_model/business_trip_response_model.dart';

import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/listizer/listizer.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../../logic/blocs/user_model_bloc/user_model_bloc.dart';

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

              return Listizer(
                listItems: model,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        model[index].purpose.toString(),
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
                                    Text("Service No: "),
                                    Text(model[index].serviceNo.toString()),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  model[index].status.toString(),
                                  style: TextStyle(color: Colors.green[800]),
                                ),
                              ),
                              Text(
                                model[index].businessTripStartDate.toString() +
                                    " -" +
                                    model[index].businessTripEndDate.toString(),
                                style: TextStyle(color: Colors.red[700]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(),
              );
            }
          }),
    );
  }
}
