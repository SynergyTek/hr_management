import 'package:flutter/material.dart';
import 'package:synergy_nts/src/models/user_model/team_model.dart';

import '../../bloc/nts_dropdown_bloc/abstract_nts_dropdown_bloc.dart';
import '../../models/user_model/read_hierarchy_model.dart';
import '../../models/user_model/user.dart';
import '../../ui/widgets/widgets.dart';

import '../../models/common_model/common_list_model.dart';

import '../../theme/theme_config.dart';

import '../../models/nts_dropdown_model/nts_dropdown_model.dart';

import 'circle_avatar.dart';
import 'empty_list_widget.dart';
import 'listizer.dart';

typedef ListTapPressedCallBack = Function(dynamic key);

class DropDownDefaultList extends StatefulWidget {
  final ListTapPressedCallBack? onListTap;
  final String? url;
  final String? ddName;
  final String? idKey;
  final String? typeKey;
  final String? nameKey;
  final List<NTSDropdownModel>? dynamicList;
  final List<CommonListModel>? commonList;
  final List<ReadTeamDataModel>? teamList;
  final List<User>? userList;
  final List<ReadUserHierarchyModel>? userHierarchyList;

  const DropDownDefaultList(
      {this.onListTap,
      this.ddName,
      this.idKey,
      this.typeKey,
      this.nameKey,
      this.url,
      this.dynamicList,
      this.commonList,
      this.teamList,
      this.userList,
      this.userHierarchyList,
      Key? key})
      : super(key: key);

  @override
  _DropDownDefaultListState createState() => _DropDownDefaultListState();
}

class _DropDownDefaultListState extends State<DropDownDefaultList> {
  List<CommonListModel> _idWardList = [];
  List<CommonListModel> _filteredIdWardList = [];
  List<ReadTeamDataModel> _idTeamList = [];
  List<ReadTeamDataModel> _filteredIdTeamList = [];
  List<User> _idUserList = [];
  List<User> _filteredIdUserList = [];
  List<ReadUserHierarchyModel> _idUserHierarchyList = [];
  List<ReadUserHierarchyModel> _filteredIdUserHierarchyList = [];
  List<NTSDropdownModel> _idNameModelList = [];
  List<NTSDropdownModel> _filteredIdNameModelList = [];

  @override
  void initState() {
    if (widget.url != null) {
      if (widget.url!.contains('EGOV_ELECTORAL_WARD')) {
        _idWardList = widget.commonList!;
      } else if (widget.url!.contains('TASK_ASSIGN_TO_TYPE')) {
        _idWardList = widget.commonList!;
      } else if (widget.url!.contains('ReadTeamData')) {
        _idTeamList = widget.teamList!;
      } else if (widget.url!.contains('ReadUserTeamData') ||
          widget.url!.contains('ReadUserData')) {
        _idUserList = widget.userList!;
      } else if (widget.url!.contains('ReadHierarchyMasterData')) {
        _idUserHierarchyList = widget.userHierarchyList!;
      } else {
        ntsDdBloc.getData(
          url: widget.url ?? '',
          idKey: widget.idKey ?? '',
          typeKey: widget.typeKey ?? '',
          nameKey: widget.nameKey ?? '',
        );
      }
    } else if (widget.dynamicList != null) {
      _idNameModelList = widget.dynamicList!;
    }

    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: widget.ddName!.contains('Select')
                ? Text(widget.ddName!)
                : Text("Select " + widget.ddName!)),
        body: Container(
          padding: DEFAULT_LARGE_PADDING,
          child: _child(),
        ));
  }

  Widget _child() {
    if (widget.url != null &&
        !(widget.url!.contains('EGOV_ELECTORAL_WARD') ||
            widget.url!.contains('TASK_ASSIGN_TO_TYPE') ||
            widget.url!.contains('ReadTeamData') ||
            widget.url!.contains('ReadUserTeamData') ||
            widget.url!.contains('ReadUserData') ||
            widget.url!.contains('ReadHierarchyMasterData'))) {
      return StreamBuilder<NTSDropdownResponse?>(
        stream: ntsDdBloc.subject.stream,
        builder: (context, AsyncSnapshot<NTSDropdownResponse?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.data == null || snapshot.data!.data!.isEmpty) {
              return EmptyListWidget();
            }
            _idNameModelList = snapshot.data!.data!;
            return _list();
          } else {
            return const Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      );
    } else if (widget.dynamicList != null) {
      _idNameModelList = widget.dynamicList!;
      return _list();
    } else if (widget.commonList != null) {
      // _idNameModelList = widget.commonList!;
      return _list();
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text("Something went wrong."),
      ),
    );
  }

  Widget _list() {
    List _dataList = widget.url != null &&
            (widget.url!.contains('EGOV_ELECTORAL_WARD') ||
                widget.url!.contains('TASK_ASSIGN_TO_TYPE'))
        ? _idWardList
        : (widget.url != null && widget.url!.contains('ReadTeamData'))
            ? _idTeamList
            : (widget.url != null &&
                    (widget.url!.contains('ReadUserTeamData') ||
                        widget.url!.contains('ReadUserData')))
                ? _idUserList
                : (widget.url != null &&
                        widget.url!.contains('ReadHierarchyMasterData'))
                    ? _idUserHierarchyList
                    : _idNameModelList;
    List _filteredDataList = widget.url != null &&
            (widget.url!.contains('EGOV_ELECTORAL_WARD') ||
                widget.url!.contains('TASK_ASSIGN_TO_TYPE'))
        ? _filteredIdWardList
        : (widget.url != null && widget.url!.contains('ReadTeamData'))
            ? _filteredIdTeamList
            : (widget.url != null &&
                    (widget.url!.contains('ReadUserTeamData') ||
                        widget.url!.contains('ReadUserData')))
                ? _filteredIdUserList
                : (widget.url != null &&
                        widget.url!.contains('ReadHierarchyMasterData'))
                    ? _filteredIdUserHierarchyList
                    : _filteredIdNameModelList;
    return Listizer(
      listItems: _dataList,
      filteredSearchList: _filteredDataList,
      itemBuilder: (context, index) {
        if (_filteredDataList[index].name != null &&
            _filteredDataList[index].name!.isNotEmpty) {
          return ListTile(
            leading: TextCircleAvater(
              text: _filteredDataList[index].name,
              title: widget.ddName,
              context: context,
              radius: 20,
              fontSize: 18,
              color: Theme.of(context).primaryColorLight,
              isTick: false,
            ),
            title: Text(
              _filteredDataList[index].name != null
                  ? _filteredDataList[index].name!
                  : "",
              maxLines: 2,
            ),
            onTap: () {
              if (widget.onListTap != null) {
                widget.onListTap!(_filteredDataList[index]);
                Navigator.pop(context);
              }
            },
          );
        } else {
          return const SizedBox(height: 0);
        }
      },
    );
  }

  @override
  void dispose() {
    _idNameModelList = [];
    _filteredIdNameModelList = [];
    _idWardList = [];
    _filteredIdWardList = [];
    _idTeamList = [];
    _filteredIdTeamList = [];
    _idUserList = [];
    _filteredIdUserList = [];
    _idUserHierarchyList = [];
    _filteredIdUserHierarchyList = [];
    super.dispose();
  }
}
