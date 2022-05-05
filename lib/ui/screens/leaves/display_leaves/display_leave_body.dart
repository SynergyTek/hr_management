import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/leave_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';

import '../../../../data/models/service_models/service.dart';
import '../../../../themes/light_theme.dart';
import '../../../widgets/empty_list_widget.dart';
import 'widget/leave_list_tile_widget.dart';

class DisplayLeavesBody extends StatefulWidget {
  DisplayLeavesBody({Key? key}) : super(key: key);

  @override
  _DisplayLeavesBodyState createState() => _DisplayLeavesBodyState();
}

class _DisplayLeavesBodyState extends State<DisplayLeavesBody> {
  @override
  void initState() {
    _handleAPI();
    super.initState();
  }

  Future<void> _handleAPI() async {
    leaveBloc.readLeaveDetailData(queryparams: {
      'userid':
          BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleAPI,
      child: StreamBuilder<ServiceListResponse?>(
        stream: leaveBloc.subjectServiceList.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _listViewBuilderWidget(
              data: snapshot.data?.list,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: LightTheme().lightThemeData().primaryColor,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _listViewBuilderWidget({
    List<Service> data = const <Service>[],
  }) {
    if (data.isEmpty) {
      return EmptyListWidget();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return LeaveListTileWidget(
          data: data.elementAt(index),
        );
      },
    );
  }

  // void _handleListTileOnTap(int index, BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     enableDrag: true,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (BuildContext context) {
  //       return LeaveDetailsBottomSheetWidget(
  //         duration: _serviceList[index].duration,
  //       );
  //     },
  //   );
  // }
}
