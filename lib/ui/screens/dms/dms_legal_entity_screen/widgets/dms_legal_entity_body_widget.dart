import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_model.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_response.dart';
import 'package:hr_management/logic/blocs/dms_bloc/dms_legal_entity_bloc/dms_legal_entity_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

class DMSLegalEntityBodyWidget extends StatefulWidget {
  final String modelName;

  DMSLegalEntityBodyWidget({
    this.modelName,
  });

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
        queryparams: _handleQueryParams(),
      );
  }

  _handleQueryParams() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            16.0,
          ),
          topRight: Radius.circular(
            16.0,
          ),
        ),
      ),
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
        return _eachListTile(
          data.elementAt(index),
        );
      },
    );
  }

  Widget _eachListTile(DMSLegalEntityModel data) {
    return ListTile(
      trailing: (widget.modelName != null &&
              data?.name != null &&
              data.name == widget.modelName)
          ? Icon(
              Icons.check,
              color: Theme.of(context).textHeadingColor,
              size: 24.0,
            )
          : Container(
              width: 0,
              height: 0,
            ),
      title: Text(
        data.name != null ? data.name : "NA",
        style: TextStyle(
          color: Theme.of(context).textHeadingColor,
        ),
      ),
      onTap: () => _handleListTileOnTap(data),
    );
  }

  _handleListTileOnTap(DMSLegalEntityModel data) {
    Navigator.of(context).pop(data);
  }
}
