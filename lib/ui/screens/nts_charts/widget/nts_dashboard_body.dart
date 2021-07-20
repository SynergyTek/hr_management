import 'package:flutter/material.dart';
import '../../../../data/enums/enums.dart';
import '../../note/widgets/note_dashboard_list.dart';
import '../nts_charts_screen.dart';
import '../../service/widget/service_dashboard_list.dart';
import '../../tasks/widget/task_dashboard_list.dart';

class ServiceDashboardBody extends StatefulWidget {
  const ServiceDashboardBody({Key key, this.ntsType}) : super(key: key);
  final NTSType ntsType;
  @override
  _ServiceDashboardBodyState createState() => _ServiceDashboardBodyState();
}

class _ServiceDashboardBodyState extends State<ServiceDashboardBody> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = []; //<Widget>[
  //   NTSChart(
  //     ntsType: NTSType.service,
  //   ),
  //   Text(
  //     'Index 1: Service Details',
  //     style: optionStyle,
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      NTSChart(
        ntsType: widget.ntsType,
      ),
      ntsDashboard(),
    ];
  }

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_rounded),
            label: 'Charts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Details',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget ntsDashboard() {
    Widget footerWidget;
    switch (widget.ntsType) {
      case NTSType.service:
        footerWidget = ServiceDashboardList();
        break;
      case NTSType.task:
        footerWidget = TaskDashboardList();
        break;
      case NTSType.note:
        footerWidget = NoteDashboardList();
        break;
      default:
        footerWidget = null;
    }
    return footerWidget;
  }

  @override
  void dispose() {
    _widgetOptions = null;
    super.dispose();
  }
}
