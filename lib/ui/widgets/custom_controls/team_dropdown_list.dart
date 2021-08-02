import 'package:flutter/material.dart';
import 'package:hr_management/data/models/user/team_model.dart';
import 'package:hr_management/data/models/user/user_response.dart';
import 'package:hr_management/logic/blocs/user_bloc/user_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:listizer/listizer.dart';

import '../appbar_widget.dart';
import '../circle_avatar.dart';
import '../empty_list_widget.dart';
import '../nts_dropdown_select.dart';
import '../progress_indicator.dart';

class TeamDropdownList extends StatefulWidget {
  final ListTapPressedCallBack onListTap;

  const TeamDropdownList({Key key, this.onListTap}) : super(key: key);

  @override
  _TeamStateDropdownList createState() => _TeamStateDropdownList();
}

class _TeamStateDropdownList extends State<TeamDropdownList> {
  List<ReadTeamDataModel> _teamDataList = [];
  List<ReadTeamDataModel> _filteredTeamDataList = [];

  @override
  void initState() {
    super.initState();
    userBLoc..readTeamData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Select Team",
      ),
      body: Container(
        padding: DEFAULT_LARGE_PADDING,
        child: StreamBuilder<ReadTeamDataResponse>(
          stream: userBLoc.subjectReadTeamData,
          builder: (context, AsyncSnapshot<ReadTeamDataResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.list == null ||
                  snapshot.data.list.length == 0) {
                return EmptyListWidget();
              }
              _teamDataList = snapshot.data.list;
              return Listizer(
                showSearchBar: true,
                listItems: _teamDataList,
                filteredSearchList: _filteredTeamDataList,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextCircleAvater(
                      text: _teamDataList[index].name,
                      context: context,
                      radius: 20,
                      fontSize: 18,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    title: Text(
                      _teamDataList[index].name != null
                          ? _teamDataList[index].name
                          : "",
                      maxLines: 2,
                    ),
                    onTap: () {
                      if (widget.onListTap != null) {
                        widget.onListTap(_teamDataList[index]);
                        Navigator.pop(context);
                      }
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CustomProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
