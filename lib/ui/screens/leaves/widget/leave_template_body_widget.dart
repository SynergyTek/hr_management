import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';
import '../../../../data/models/leave_models/leave_res_model.dart';
import '../../../../data/models/leave_models/leave_temp_model.dart';
import '../../../../logic/blocs/leave_temp_bloc/leave_temp_api_bloc.dart';
import '../../../../themes/theme_config.dart';

import 'grid_widget.dart';

class LeaveTemplateBody extends StatefulWidget {
  const LeaveTemplateBody({Key key}) : super(key: key);

  @override
  _LeaveTemplateBodyState createState() => _LeaveTemplateBodyState();
}

class _LeaveTemplateBodyState extends State<LeaveTemplateBody> {
  @override
  void initState() {
    super.initState();
    leaveTempBloc..getAllowedTemplateData();
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
                    childAspectRatio: 2 / 2.2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: snapshot?.data?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  LeaveTemplateModel leaveTempResponse =
                      snapshot.data.data[index];
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: buildFront(
                        templateName: leaveTempResponse.displayName,
                        templateImageCode: leaveTempResponse.iconFileId,
                        colorCode: leaveTempResponse.templateColor,
                        context: context),
                    back: buildRear(
                        templateCode: leaveTempResponse.code,
                        templateName: snapshot.data.data[index].displayName,
                        colorCode: leaveTempResponse.templateColor,
                        context: context),
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
