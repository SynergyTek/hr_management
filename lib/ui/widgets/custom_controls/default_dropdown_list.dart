import 'package:flutter/material.dart';
import 'package:hr_management/data/models/nts_dropdown/nts_dropdown_model.dart';
import 'package:listizer/listizer.dart';
import '../appbar_widget.dart';
import '../circle_avatar.dart';
import '../empty_list_widget.dart';
import '../nts_dropdown_select.dart';

class DropDownDefaultList extends StatefulWidget {
  final ListTapPressedCallBack onListTap;
  final String ddName;
  final String idKey;
  final String nameKey;
  DropDownDefaultList(
      {Key key, this.onListTap, this.ddName, this.idKey, this.nameKey})
      : super(key: key);

  @override
  _DropDownDefaultListState createState() => _DropDownDefaultListState();
}

class _DropDownDefaultListState extends State<DropDownDefaultList> {
  List<NTSDropdownModel> _idNameModelList = [];
  List<NTSDropdownModel> _filteredIdNameModelList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
          title: "Leave Template",
        ),
        body: _idNameModelList == null || _idNameModelList.length == 0
            ? EmptyListWidget()
            : Listizer(
                showSearchBar: true,
                listItems: _idNameModelList,
                filteredSearchList: _filteredIdNameModelList,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextCircleAvater(
                        text: _filteredIdNameModelList[index].name,
                        context: context,
                        radius: 20,
                        fontSize: 18,
                        color: Theme.of(context).primaryColorLight),
                    title: Text(
                      _filteredIdNameModelList[index].name != null
                          ? _filteredIdNameModelList[index].name
                          : "",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onTap: () {
                      if (widget.onListTap != null) {
                        widget.onListTap(_filteredIdNameModelList[index]);
                        Navigator.of(context).pop();
                      }
                    },
                  );
                },
              ));
  }
}
