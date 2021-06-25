import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/data/models/leave_models/leave_res_model.dart';
import 'package:hr_management/data/models/leave_models/leave_temp_model.dart';
import 'package:hr_management/logic/blocs/leave_temp_bloc/leave_temp_api_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';

import 'grid_widget.dart';

class LeaveTemplateBody extends StatefulWidget {
  const LeaveTemplateBody({Key key}) : super(key: key);

  @override
  _LeaveTemplateBodyState createState() => _LeaveTemplateBodyState();
}

class _LeaveTemplateBodyState extends State<LeaveTemplateBody> {
  Future<List<LeaveTemplateModel>> fetchLeaveTemplates;

  @override
  void initState() {
    super.initState();
    leaveTempBloc..getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<LeaveTempResponse>(
          stream: leaveTempBloc.subject.stream,
          builder: (context, AsyncSnapshot snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: snapshot?.data?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: buildFront(snapshot.data.data[index].displayName),
                    back: buildRear(snapshot.data.data[index].displayName),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
