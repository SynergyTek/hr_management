import 'package:flutter/material.dart';
import '../../../bloc/user_bloc/abstract_user_bloc.dart';
import '../../../models/user_model/team_model.dart';
import '../../../theme/theme_config.dart';
import '../circle_avatar.dart';
import '../custom_progress_indicator.dart';
import '../default_dropdown_list.dart';
import '../empty_list_widget.dart';
import '../listizer.dart';

class TeamDropdownList extends StatefulWidget {
  final ListTapPressedCallBack? onListTap;

  const TeamDropdownList({Key? key, this.onListTap}) : super(key: key);

  @override
  _TeamStateDropdownList createState() => _TeamStateDropdownList();
}

class _TeamStateDropdownList extends State<TeamDropdownList> {
  List<ReadTeamDataModel>? _teamDataList = [];
  List<ReadTeamDataModel> _filteredTeamDataList = [];

  @override
  void initState() {
    super.initState();
    userBLoc.readTeamData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Team"),
      ),
      body: Container(
        padding: DEFAULT_LARGE_PADDING,
        child: StreamBuilder<ReadTeamDataResponse?>(
          stream: userBLoc.subjectReadTeamData.stream,
          builder: (context, AsyncSnapshot<ReadTeamDataResponse?> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.list == null || snapshot.data!.list!.isEmpty) {
                return EmptyListWidget();
              }
              _teamDataList = snapshot.data!.list;
              return Listizer(
                showSearchBar: !true,
                listItems: _teamDataList,
                filteredSearchList: _filteredTeamDataList,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextCircleAvater(
                      isTick: false, //TODO
                      text: _teamDataList![index].name,
                      context: context,
                      radius: 20,
                      fontSize: 18,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    title: Text(
                      _teamDataList![index].name != null
                          ? _teamDataList![index].name!
                          : "",
                      maxLines: 2,
                    ),
                    onTap: () {
                      if (widget.onListTap != null) {
                        widget.onListTap!(_teamDataList![index]);
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
