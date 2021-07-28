import '../../../../data/enums/enums.dart';
import '../../../../data/models/nts_template_tree_list_models/nts_template_tree_list_model.dart';
import '../../../../data/models/nts_template_tree_list_models/nts_template_tree_list_response.dart';
import '../../../../logic/blocs/nts_template_tree_list_bloc/nts_template_tree_list_bloc.dart';
import '../../../widgets/progress_indicator.dart';

import '../../../../themes/theme_config.dart';
import 'package:flutter/material.dart';

class TestScreenBodyWidget extends StatefulWidget {
  final NTSType ntsType;

  TestScreenBodyWidget({
    @required this.ntsType,
  });

  @override
  _TestScreenBodyWidgetState createState() => _TestScreenBodyWidgetState();
}

class _TestScreenBodyWidgetState extends State<TestScreenBodyWidget> {
  Map<String, TreeViewModelChildren> _checkedFilterSelectedItemsMap = Map();

  @override
  void initState() {
    super.initState();

    ntsTemplateTreeListBloc..getData(queryparams: _handleQueryParams());
  }

  /// Helper function to handle query params for the API
  _handleQueryParams() {
    if (widget.ntsType == null) return {'id': 'Note'};

    if (widget.ntsType == NTSType.note) return {'id': 'Note'};
    if (widget.ntsType == NTSType.task) return {'id': 'Task'};
    if (widget.ntsType == NTSType.service) return {'id': 'Service'};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<NTSTemplateTreeListResponse>(
        stream: ntsTemplateTreeListBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _testWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _testWidget(List data) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: _handleFilterChips(),
        ),
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () => _handleFilterOnPressed(data),
        ),
      ],
    );
  }

  _handleFilterOnPressed(List<NTSTemplateTreeListModel> data) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
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
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _eachItemExpansionTile(
                      data.elementAt(index),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _eachItemExpansionTile(NTSTemplateTreeListModel eachData) {
    return ExpansionTile(
      title: Text(eachData.name),
      children: _expansionTileChildren(eachData),
    );
  }

  List<Widget> _expansionTileChildren(NTSTemplateTreeListModel eachData) {
    List<Widget> _expansionTileWidgetList = [];

    if (eachData?.treeViewModelChildren == null)
      return _expansionTileWidgetList..add(Container());

    eachData.treeViewModelChildren.forEach((eachItem) {
      _expansionTileWidgetList
        ..add(
          ListTile(
            leading: Icon(Icons.filter_list),
            title: Text(eachItem.displayName ?? ""),
            // value: eachItem?.checked ?? false,
            // onChanged: (bool hasChanged) {
            onTap: () {
              setState(() {
                // Updating the value of the checkbox listtile.
                eachItem.checked = !eachItem.checked;

                // If key is already present remove the entry from the map.
                // If the id is not present in the map then add a new entry to the map.
                if (!_checkedFilterSelectedItemsMap.containsKey(eachItem.id)) {
                  _checkedFilterSelectedItemsMap[eachItem.id] = eachItem;
                } else {
                  _checkedFilterSelectedItemsMap.remove(eachItem.id);
                }
              });
            },
          ),
        );
    });

    return _expansionTileWidgetList;
  }

  Widget _handleFilterChips() {
    List<Widget> _chips = [];

    _checkedFilterSelectedItemsMap.values.forEach((eachChip) {
      _chips
        ..add(
          Container(
            padding: DEFAULT_HORIZONTAL_PADDING,
            child: Chip(
              backgroundColor: Theme.of(context).textHeadingColor,
              label: Text(
                eachChip.displayName ?? "",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
    });

    return Wrap(
      children: _chips,
    );
  }
}
