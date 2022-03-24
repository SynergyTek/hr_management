import 'package:flutter/material.dart';
import '../../../../data/models/component_result_models/component_result_model.dart';
import '../../../../data/models/component_result_models/component_result_response.dart';
import '../../../../logic/blocs/component_result_bloc/component_result_bloc.dart';

import '../../../../data/models/nts_template_tree_list_models/nts_template_tree_list_response.dart';
import '../../../../logic/blocs/nts_template_tree_list_bloc/nts_template_tree_list_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

class ComponentResultBodyWidget extends StatefulWidget {
  final String serviceId;

  ComponentResultBodyWidget({
    required this.serviceId,
  });

  @override
  _ComponentResultBodyWidgetState createState() =>
      _ComponentResultBodyWidgetState();
}

class _ComponentResultBodyWidgetState extends State<ComponentResultBodyWidget> {
  @override
  void initState() {
    super.initState();

    componentResultBloc
      ..getData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams() => {
        'serviceId': widget.serviceId,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<ComponentResultResponse>(
        stream: componentResultBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _componentResultWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _componentResultWidget(List<ComponentResultModel>? data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return _eachListTile(
          data: data.elementAt(index),
        );
      },
    );
  }

  Widget _eachListTile({
    required ComponentResultModel data,
  }) {
    return Card(
      child: ListTile(
        title: Text(data.assignee ?? "-"),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${data.startDate} to ${data.endDate}"),
            Text("Error: ${data.error ?? "NA"}"),
          ],
        ),
        trailing: Text(
          data.componentStatusName ?? "-",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: _handleListTileColor(context, data.componentStatusName),
              ),
        ),
      ),
    );
  }

  Color _handleListTileColor(BuildContext context, String? data) {
    // Guard clause
    if (data == null || data.isEmpty) return Colors.white54;

    if (data == 'Inprogress') return Colors.redAccent;
    if (data == 'Draft') return Theme.of(context).textHeadingColor;
    if (data == 'Completed') return Colors.greenAccent;

    return Theme.of(context).invertedColor;
  }
}
