import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hr_management/data/models/business_trip_model/business_trip_model.dart';
import 'package:hr_management/data/models/business_trip_model/business_trip_response_model.dart';
import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
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

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2.2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: model.length,
                itemBuilder: (context, index) {
                  BusinessTripModel item = model[index];
                  return GestureDetector(
                    child: Card(
                      margin: DEFAULT_PADDING,
                      elevation: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (item.serviceNo != null)
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            item.serviceNo.toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    onTap: () {},
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
