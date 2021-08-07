import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';

class CaseManagementFilterBottomModalSheetWidget extends StatefulWidget {
  final List<FilterListModel> data;

  const CaseManagementFilterBottomModalSheetWidget({
    @required this.data,
  }) : assert(data != null);

  @override
  _CaseManagementFilterBottomModalSheetWidgetState createState() =>
      _CaseManagementFilterBottomModalSheetWidgetState();
}

class _CaseManagementFilterBottomModalSheetWidgetState
    extends State<CaseManagementFilterBottomModalSheetWidget> {
  List<FilterListModel> data;

  @override
  void initState() {
    super.initState();

    data = widget?.data ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
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
        width: double.infinity,
        padding: DEFAULT_LARGE_PADDING,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.filter_list),
              title: Text("Filter"),
              trailing: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => Navigator.of(context).pop(data),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return _eachListTile(
                    data.elementAt(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _eachListTile(FilterListModel eachData) {
    if (eachData?.filterDisplayTitle == null) return Container();

    return StatefulBuilder(
      builder: (BuildContext context, innerSetState) {
        return CheckboxListTile(
          title: Text(eachData.filterDisplayTitle ?? ""),
          value: eachData?.isChecked ?? false,
          onChanged: (bool hasChanged) {
            innerSetState(() {
              setState(() {
                // Updating the value of the checkbox listtile.
                eachData.isChecked = true;

                data.forEach((element) {
                  if (element == eachData)
                    element.isChecked = eachData.isChecked;
                  else
                    element.isChecked = false;
                });
              });
            });

            Navigator.of(context).pop(data);
          },
        );
      },
    );
  }
}

class FilterListModel {
  String filterDisplayTitle;
  String filterValue;
  bool isChecked;

  FilterListModel({
    @required this.filterDisplayTitle,
    @required this.filterValue,
    @required this.isChecked,
  });
}
