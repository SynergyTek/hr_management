import 'package:flutter/material.dart';
import 'package:listizer/listizer.dart';

import 'package:hr_management/data/models/user/user.dart';
import 'package:hr_management/data/models/user/user_response.dart';
import 'package:hr_management/logic/blocs/user_bloc/user_bloc.dart';
import 'package:hr_management/themes/theme_config.dart';

import '../appbar_widget.dart';
import '../circle_avatar.dart';
import '../empty_list_widget.dart';
import '../nts_dropdown_select.dart';
import '../progress_indicator.dart';

class UserDropDownList extends StatefulWidget {
  final ListTapPressedCallBack onListTap;

  const UserDropDownList({
    Key key,
    this.onListTap,
  }) : super(key: key);

  @override
  _UserStateDropDownList createState() => _UserStateDropDownList();
}

class _UserStateDropDownList extends State<UserDropDownList> {
  List<User> _userDataList = [];
  List<User> _filterUserDataList = [];
  @override
  void initState() {
    super.initState();
    userBLoc..readUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Select User",
      ),
      body: Container(
        padding: DEFAULT_LARGE_PADDING,
        child: StreamBuilder<UserListResponse>(
          stream: userBLoc.subjectUserDataList.stream,
          builder: (context, AsyncSnapshot<UserListResponse> snapshot) {
            print("Snapshot data: ${snapshot.data}");
            if (snapshot.hasData) {
              if (snapshot.data.list == null ||
                  snapshot.data.list.length == 0) {
                return EmptyListWidget();
              }
              _userDataList = snapshot.data.list;
              return Listizer(
                showSearchBar: true,
                listItems: _userDataList,
                filteredSearchList: _filterUserDataList,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextCircleAvater(
                      text: _userDataList[index].name,
                      context: context,
                      radius: 20,
                      fontSize: 18,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    title: Text(
                      _userDataList[index].name != null
                          ? _userDataList[index].name
                          : "",
                      maxLines: 2,
                    ),
                    onTap: () {
                      if (widget.onListTap != null) {
                        widget.onListTap(_userDataList[index]);
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
