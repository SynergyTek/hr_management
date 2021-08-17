import 'package:flutter/material.dart';

import '../../../../constants/image_path_constants.dart';
import '../../../../routes/route_constants.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/synergy_divider_widget.dart';

class CaseManagementBodyWidget extends StatefulWidget {
  CaseManagementBodyWidget();

  @override
  _CaseManagementBodyWidgetState createState() =>
      _CaseManagementBodyWidgetState();
}

class _CaseManagementBodyWidgetState extends State<CaseManagementBodyWidget> {
  Map<String, String> _caseManagementDataMap = Map();

  @override
  void initState() {
    super.initState();

    _caseManagementDataMap = {
      'Home': CASE_MANAGEMENT_HOME,
      'Dashboard': CASE_MANAGEMENT_DASHBOARD,
      'Service List': CASE_MANAGEMENT_SERVICE_LIST,
      'Task List': CASE_MANAGEMENT_TASK_LIST,
      'Service Report': CASE_MANAGEMENT_SERVICE_REPORT,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: _gridviewWidget(
        _caseManagementDataMap,
      ),
    );
  }

  Widget _gridviewWidget(Map<String, String> data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 160,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          onTap: () => _handleListTileOnTap(
            context: context,
            listTileDataKey: data.keys.elementAt(index),
          ),
          child: Container(
            padding: DEFAULT_LARGE_HORIZONTAL_PADDING,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(32),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Image.asset(
                    data.values.elementAt(index),
                    fit: BoxFit.fill,
                  ),
                ),
                SynergyDividerWidget(
                  color: Theme.of(context).accentColor,
                ),
                Container(
                  padding: DEFAULT_PADDING,
                  alignment: Alignment.center,
                  child: Text(
                    data.keys.elementAt(index),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleListTileOnTap({
    BuildContext context,
    String listTileDataKey,
  }) {
    if (listTileDataKey == null || listTileDataKey.isEmpty) return;

    if (listTileDataKey == 'Home')
      Navigator.pushNamed(
        context,
        WORKLIST_DASHBOARD,
      );

    if (listTileDataKey == 'Dashboard')
      Navigator.pushNamed(
        context,
        CASE_MANAGEMENT_HELPDESK_DASHBOARD_ROUTE,
      );

    if (listTileDataKey == 'Task List')
      Navigator.pushNamed(
        context,
        TASK_HOME,
      );

    if (listTileDataKey == 'Service List')
      Navigator.pushNamed(
        context,
        SERVICE_HOME,
      );

    if (listTileDataKey == 'Service Report') return;

    return;
  }
}
