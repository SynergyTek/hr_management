import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/ui/screens/reimbursement_screens/widgets/reimbursement_list_view_widget.dart';

import '../../../logic/blocs/leave_bloc.dart';
import '../../../logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import '../../widgets/internet_connectivity_widget.dart';

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
          "portalName": "HR",
        },
      );
    }

    // Medical
    else if (_selectedIndex == 1) {
      await leaveBloc.getMedicalReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
        },
      );
    }

    // Education
    else if (_selectedIndex == 2) {
      await leaveBloc.getEducationalReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
        },
      );
    }

    // Other
    else if (_selectedIndex == 3) {
      await leaveBloc.getOtherReimbursementData(
        queryparams: {
          "userId":
              BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? '',
          "portalName": "HR",
        },
      );
    }
  }
}