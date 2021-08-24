import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_model.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_response.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_legal_entity_bloc/dms_legal_entity_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

class DMSLegalEntityBodyWidget extends StatefulWidget {
  DMSLegalEntityBodyWidget();

  @override
  _DMSLegalEntityBodyWidgetState createState() =>
      _DMSLegalEntityBodyWidgetState();
}

class _DMSLegalEntityBodyWidgetState extends State<DMSLegalEntityBodyWidget> {
  @override
  void initState() {
    super.initState();

    dmsLegalEntityBloc
      ..getAPIData(
          //  queryparams: _handleQueryParams(),
          );
  }

  _handleQueryParams() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<DMSLegalEntityResponse>(
        stream: dmsLegalEntityBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _listviewWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _listviewWidget(List<DMSLegalEntityModel> data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data available.",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      );

    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: UniqueKey(),
          background: slideRightBackground(),
          child: _eachListTile(
            data.elementAt(index),
          ),
          confirmDismiss: (DismissDirection direction) async {
            final bool res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("Are you sure you want to edit this entry?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
            return res;
          },
        );
      },
    );
  }

  Widget slideRightBackground() {
    return Container(
      padding: DEFAULT_LARGE_HORIZONTAL_PADDING,
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              "\t Edit \t",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget _eachListTile(DMSLegalEntityModel data) {

    return Card(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  data.name!=null?data.name:"NA",
                  style: TextStyle(
                    color: Theme.of(context).textHeadingColor,
                  ),
                ),
              
            )])));
  }
}
