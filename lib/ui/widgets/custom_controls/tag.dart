import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/themes/theme_config.dart';

import 'package:listizer/listizer.dart';

typedef OnTapPressedCallBack = void Function(
  dynamic key,
  dynamic key2,
  dynamic key3,
);

class SelectTag extends StatefulWidget {
  final dynamic selectedModel;
  final NTSType ntstype;
  final OnTapPressedCallBack onListTap;
  final String ntsId;

  const SelectTag(
      {Key key, this.selectedModel, this.ntstype, this.onListTap, this.ntsId})
      : super(key: key);

  @override
  _SelectTagState createState() => _SelectTagState();
}

class _SelectTagState extends State<SelectTag> {
  List<String> _teamDataList = ['1', '2', '3'];
  List<String> _filteredTeamDataList = [];
  final List<bool> _chkVal = <bool>[false, false, false];
  List<String> tags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Tags'),
        actions: [
          TextButton(
            onPressed: () {
              print(tags);
              Navigator.pop(context);
            },
            child: Text('Save'),
          )
        ],
      ),
      body: Container(
        padding: DEFAULT_LARGE_PADDING,
        child: Listizer(
          showSearchBar: true,
          listItems: _teamDataList,
          filteredSearchList: _filteredTeamDataList,
          itemBuilder: (context, index) {
            return CheckboxListTile(
                value: _chkVal[index],
                title: Text(
                  _teamDataList[index],
                  maxLines: 2,
                ),
                onChanged: (bool value) {
                  setState(() {
                    _chkVal[index] = value;
                    (_chkVal[index] == true)
                        ? tags.add(_teamDataList[index])
                        : tags.remove(_teamDataList[index]);
                  });
                  // if (widget.onListTap != null) {
                  // widget.onListTap(_teamDataList[index]);
                  // Navigator.pop(context);
                  // }
                });
          },
        ),
      ),
    );
  }
}
