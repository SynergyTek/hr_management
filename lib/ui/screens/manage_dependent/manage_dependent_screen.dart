import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/manage_dependent/widget/dependent_document_list.dart';
import 'package:hr_management/ui/screens/manage_dependent/widget/dependent_list.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/ui/widgets/drawer/nav_drawer_widget.dart';
import 'package:hr_management/ui/widgets/internet_connectivity_widget.dart';

class ManageDependentScreen extends StatefulWidget {
  @override
  _ManageDependentScreenState createState() => _ManageDependentScreenState();
}

class _ManageDependentScreenState extends State<ManageDependentScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

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
      drawer: drawerWidget(context),
      appBar: AppbarWidget(
        title: "Manage Dependents",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
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
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          ADD_EDIT_NOTE_ROUTE,
          arguments: ScreenArguments(
            arg1: 'HRDependant',
            arg2: '',
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
