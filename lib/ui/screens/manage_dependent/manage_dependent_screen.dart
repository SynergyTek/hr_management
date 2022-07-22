import 'package:flutter/material.dart';

import '../../../routes/route_constants.dart';
import '../../../routes/screen_arguments.dart';
import '../../../themes/light_theme.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import 'widget/dependent_document_list.dart';
import 'widget/dependent_list.dart';

class ManageDependentScreen extends StatefulWidget {
  @override
  _ManageDependentScreenState createState() => _ManageDependentScreenState();
}

class _ManageDependentScreenState extends State<ManageDependentScreen> {
  int _selectedIndex = 0;
  List<Widget>? _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      DependentList(),
      DependentDocumentList(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      DependentList();
    } else if (index == 0) {
      DependentDocumentList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(
        title: "Manage Dependents",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: Center(
            child: _widgetOptions!.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Dependants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_present),
            label: 'Document Requested by HR',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          ADD_EDIT_NOTE_ROUTE,
          arguments: ScreenArguments(
            arg1: 'HRDependant',
            arg2: '',
            val1: true,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _widgetOptions = null;
    super.dispose();
  }
}
