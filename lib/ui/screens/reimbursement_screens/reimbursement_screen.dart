import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/ui/screens/reimbursement_screens/widgets/reimbursement_list_view_widget.dart';

import '../../../data/enums/enums.dart';
import '../../../logic/blocs/leave_bloc.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import '../../../themes/light_theme.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

class ReimbursementScreen extends StatefulWidget {
  ReimbursementScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReimbursementScreen> createState() => _ReimbursementScreenState();
}

class _ReimbursementScreenState extends State<ReimbursementScreen> {
  int _selectedIndex = 0;
  final List _bodyList = [
    // Travel
    ReimbursementListViewWidget(selectedIndex: 0),

    // Medical
    ReimbursementListViewWidget(selectedIndex: 1),

    // Education
    ReimbursementListViewWidget(selectedIndex: 2),

    // Other
    ReimbursementListViewWidget(selectedIndex: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Reimbursement",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: _bodyList.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: _bottomNavigationWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          CREATE_SERVICE_ROUTE,
          arguments: ScreenArguments(
            arg1: (_selectedIndex == 0)
                ? "REIMB_TRAVEL"
                : (_selectedIndex == 1)
                    ? "REIMB_MDECIAL"
                    : (_selectedIndex == 2)
                        ? "REIMB_EDUCATIONAL"
                        : (_selectedIndex == 3)
                            ? "REIMB_OTHERS"
                            : null,
            arg4: (_selectedIndex == 0)
                ? "REIMB_TRAVEL"
                : (_selectedIndex == 1)
                    ? "REIMB_MDECIAL"
                    : (_selectedIndex == 2)
                        ? "REIMB_EDUCATIONAL"
                        : (_selectedIndex == 3)
                            ? "REIMB_OTHERS"
                            : null,
            // arg2: "",
            val1: false,
            // arg3: "",
            // portalType: PortalType.hr,
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationWidget() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: 'Travel',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services_outlined),
          label: 'Medical',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school_outlined),
          label: 'Education',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_outline_sharp),
          label: 'Other',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: const Color(0xFF979797),
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    // Travel
    if (_selectedIndex == 0) {
      await leaveBloc.getTravelReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
        },
      );
    }

    // Medical
    else if (_selectedIndex == 1) {
      await leaveBloc.getMedicalReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
        },
      );
    }

    // Education
    else if (_selectedIndex == 2) {
      await leaveBloc.getEducationalReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
        },
      );
    }

    // Other
    else if (_selectedIndex == 3) {
      await leaveBloc.getOtherReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": BlocProvider.of<UserModelBloc>(context)
                  .state
                  .extraUserInformation
                  ?.portalType ??
              "HR",
        },
      );
    }
  }
}
