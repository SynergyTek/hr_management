import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/data/models/api_models/leave_temp_model.dart';
import 'package:hr_management/helper/http_helper.dart';

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
    fetchLeaveTemplates = httpFetchLeaveTemplate(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
        child: FutureBuilder<List<LeaveTemplateModel>>(
            future: fetchLeaveTemplates,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final t = snapshot.data[index];
                    return FlipCard(
                        direction: FlipDirection.HORIZONTAL,
                        front: buildFront(t.displayName),
                        back: buildRear(t.displayName));
                  });
            }));
  }
}
