import 'package:flutter/material.dart';
import 'package:synergy_nts/src/models/udf_models/udf_json_model.dart';

import '../../../synergy_nts.dart';
import '../../theme/light_theme.dart';
import '../widgets/tag.dart';
import 'widget/tag_nts_body.dart';

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
      appBar: AppBar(
        title: const Text("Tags"),
      ),
      body: SafeArea(
        child: TagNTSBodyWidget(
          ntsType: ntsType,
          ntsId: ntsId,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightTheme().lightThemeData().primaryColor,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return SelectTag(
                ntsId: ntsId,
                ntstype: NTSType.service,
              );
            }),
          );
          // Navigator.pushNamed(
          //   context,
          //   NTS_TAG,
          //   arguments: ScreenArguments(
          //       arg1: ntsId,
          //       ntstype: ntsType,
          //       callBack: (dynamic value, dynamic value2, dynamic value3) {}),
          // );
        },
      ),
    );
  }
}
