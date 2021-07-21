import 'package:flutter/material.dart';
import '../../../../data/enums/enums.dart';
import '../../nts_charts/nts_charts_screen.dart';

class ServiceDashboardBody extends StatefulWidget {
  const ServiceDashboardBody({Key key}) : super(key: key);

  @override
  _ServiceDashboardBodyState createState() => _ServiceDashboardBodyState();
}

class _ServiceDashboardBodyState extends State<ServiceDashboardBody> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    NTSChart(
      ntsType: NTSType.service,
    ),
    Text(
      'Index 1: Service Details',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_rounded),
            label: 'Service Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Service Details',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
