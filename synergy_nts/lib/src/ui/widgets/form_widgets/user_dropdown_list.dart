import 'package:flutter/material.dart';

import '../../../bloc/user_bloc/abstract_user_bloc.dart';
import '../../../theme/theme_config.dart';
import '../custom_progress_indicator.dart';
import '../listizer.dart';
import '../circle_avatar.dart';
import '../empty_list_widget.dart';
import '../nts_widgets/nts_dropdown_select.dart';


class UserDropDownList extends StatefulWidget {
  final ListTapPressedCallBack? onListTap;

  const UserDropDownList({
    Key? key,
    this.onListTap,
  }) : super(key: key);

  @override
  _UserStateDropDownList createState() => _UserStateDropDownList();
}

class _UserStateDropDownList extends State<UserDropDownList> {
  List<User>? _userDataList = [];
  List<User>? _filterUserDataList = [];
  @override
  void initState() {
    super.initState();
    userBLoc.readUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select User"),
      ),
      body: Container(
        padding: DEFAULT_LARGE_PADDING,
        child: StreamBuilder<UserListResponse?>(
          stream: userBLoc.subjectUserDataList.stream,
          builder: (context, AsyncSnapshot<UserListResponse?> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.list == null || snapshot.data!.list!.isEmpty) {
                return EmptyListWidget();
              }
              _userDataList = snapshot.data!.list!;
              return Listizer(
                listItems: _userDataList,
                filteredSearchList: _filterUserDataList,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextCircleAvater(
                      text: _userDataList![index].name,
                      context: context,
                      radius: 20,
                      fontSize: 18,
                      color: Theme.of(context).primaryColorLight,
                      isTick: false,
                    ),
                    title: Text(
                      _userDataList![index].name != null
                          ? _userDataList![index].name!
                          : "",
                      maxLines: 2,
                    ),
                    onTap: () {
                      if (widget.onListTap != null) {
                        widget.onListTap!(_userDataList![index]);
                        Navigator.pop(context);
                      }
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CustomProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
