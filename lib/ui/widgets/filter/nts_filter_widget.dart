import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/maps/maps.dart';

import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/tasks/widget/task_home_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class NTSFilterWidget extends StatefulWidget {
  final FilterListTapCallBack onListTap;
  final NTSType filterType;

  const NTSFilterWidget({
    Key key,
    this.onListTap,
    this.filterType,
  }) : super(key: key);

  @override
  _NTSFilterWidgetState createState() => _NTSFilterWidgetState();
}

class _NTSFilterWidgetState extends State<NTSFilterWidget> {
  bool showFilter = false;
  Map<String, String> filterOptions = Map();

  @override
  void initState() {
    super.initState();
    print(widget.filterType);
    assignFilterData();
  }

  assignFilterData() {
    switch (widget.filterType) {
      case NTSType.service:
        filterOptions = filterServiceOptionsMap;
        break;
      case NTSType.task:
        filterOptions = filterTaskOptionsMap;
        break;
      case NTSType.note:
        filterOptions = filterNoteOptionsMap;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Task Filter",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: Container(
            padding: DEFAULT_LARGE_PADDING,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            optionsRow(text: 'Modules'),
                            optionsRow(
                              text: 'Filters',
                              onTap: () {
                                setState(() {
                                  showFilter = !showFilter;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(color: Colors.grey),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            if (showFilter)
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: filterOptions.keys.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(filterOptions[
                                        filterOptions.keys.elementAt(index)]),
                                    onTap: () {
                                      widget.onListTap(
                                          filterOptions.keys.elementAt(index));
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     PrimaryButton(
                //       buttonText: 'Cancel',
                //       handleOnPressed: Navigator.pop,
                //       width: 100,
                //     ),
                //     PrimaryButton(
                //       buttonText: 'Apply',
                //       handleOnPressed: Navigator.pop,
                //       width: 100,
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  optionsRow({String text, Function onTap}) {
    return InkWell(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: onTap,
    );
  }
}
