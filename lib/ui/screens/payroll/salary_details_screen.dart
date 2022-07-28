import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';

import '../../widgets/drawer/nav_drawer_widget.dart';
import 'widget/salary_details_screen_body.dart';

class SalaryDetailsScreen extends StatelessWidget {
  const SalaryDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Salary Details'),
      drawer: DrawerWidget(),
      body: SalaryDetailsScreenBody(),
    );
  }
}
