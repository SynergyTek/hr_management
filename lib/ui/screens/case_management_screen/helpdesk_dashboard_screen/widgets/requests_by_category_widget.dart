import 'package:flutter/material.dart';
import 'package:hr_management/data/models/case_management_model/case_management_model.dart';
import 'package:hr_management/data/models/case_management_model/case_management_response.dart';
import 'package:hr_management/logic/blocs/case_management_bloc/helpdesk_box_1_bloc/helpdesk_box_1_bloc.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

import '../../../../../themes/theme_config.dart';
import '../../../../widgets/progress_indicator.dart';
import 'case_management_filter_bottom_modal_sheet_widget.dart';

class RequestByCategoryWidget extends StatefulWidget {
  RequestByCategoryWidget();

  @override
  _RequestByCategoryWidgetState createState() =>
      _RequestByCategoryWidgetState();
}

class _RequestByCategoryWidgetState extends State<RequestByCategoryWidget> {
  List<FilterListModel> data = [
    FilterListModel(
      filterDisplayTitle: 'Category',
      filterValue: 'Category',
      isChecked: true,
    ),
    FilterListModel(
      filterDisplayTitle: 'Owner',
      filterValue: 'Owner',
      isChecked: false,
    ),
    FilterListModel(
      filterDisplayTitle: 'Priority',
      filterValue: 'Priority',
      isChecked: false,
    ),
    FilterListModel(
      filterDisplayTitle: 'Service',
      filterValue: 'Service',
      isChecked: false,
    ),
  ];

  @override
  void initState() {
    super.initState();

    helpdeskBox1Bloc
      ..getData(
        queryparams: _handleQueryparams(),
      );
  }

  _handleQueryparams({FilterListModel model}) {
    if (model == null)
      return {
        'type': 'Category',
      };

    return {
      'type': model.filterValue,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<CaseManagementResponse>(
        stream: helpdeskBox1Bloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _bodyWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _bodyWidget(List<CaseManagementModel> data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _filterWidget(),
        Expanded(
          child: ListView.builder(
            itemCount: data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return _eachListTile(
                data: data.elementAt(index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _eachListTile({
    @required CaseManagementModel data,
  }) {
    return Card(
      child: ListTile(
        title: Container(
          padding: DEFAULT_VERTICAL_PADDING,
          child: Text(data?.name ?? "-"),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'In Progress: \t',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        TextSpan(
                          text: data?.inProgress.toString() ?? "-",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Draft: \t',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: data?.draft.toString() ?? "-",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Overdue: \t',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: data?.overDue.toString() ?? "-",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Completed: \t',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(
                          text: data?.completed.toString() ?? "-",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterWidget() {
    return ListTile(
      title: Text("Filter"),
      trailing: Icon(
        Icons.filter_list,
      ),
      onTap: () => _handleFilterWidgetOnTap(),
    );
  }

  void _handleFilterWidgetOnTap() async {
    showModalBottomSheet<List<FilterListModel>>(
      context: context,
      enableDrag: false,
      isScrollControlled: false,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) =>
          CaseManagementFilterBottomModalSheetWidget(
        data: data,
      ),
    ).then((List<FilterListModel> value) {
      if (value != null) {
        data = value;
      }

      value.forEach((element) {
        if (element.isChecked == true) {
          helpdeskBox1Bloc
            ..getData(
              queryparams: _handleQueryparams(model: element),
            );
        }
      });
    });
  }
}
