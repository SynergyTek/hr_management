import 'package:flutter/material.dart';
// import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/routes/route_constants.dart';
import 'package:hr_management/routes/screen_arguments.dart';
import 'package:hr_management/ui/screens/tag_nts_screen/widget/tag_nts_body.dart';
import 'package:hr_management/ui/widgets/appbar_widget.dart';
import 'package:hr_management/logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';

import '../../../themes/light_theme.dart';
import 'package:synergy_nts/synergy_nts.dart';

class TagNTSScreen extends StatelessWidget {
  final NTSType? ntsType;
  final String? ntsId;

  const TagNTSScreen({
    required this.ntsType,
    required this.ntsId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Tags",
      ),
      body: SafeArea(
        child: InternetConnectivityWidget(
          child: TagNTSBodyWidget(
            ntsType: ntsType,
            ntsId: ntsId,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            NTS_TAG,
            arguments: ScreenArguments(
                arg1: ntsId,
                ntstype: ntsType,
                callBack: (dynamic value, dynamic value2, dynamic value3) {}),
          );
        },
      ),
    );
  }
}
