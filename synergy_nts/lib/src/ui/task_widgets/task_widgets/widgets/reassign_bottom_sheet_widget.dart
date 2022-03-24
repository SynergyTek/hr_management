import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../models/user_model/team_model.dart';
import '../../../widgets/widgets.dart';

class ReassignBottomSheetWidget extends StatefulWidget {
  final List<ReadTeamDataModel?> data;
  final ReadTeamDataModel? selectedDataMember;
  final ValueChanged<ReadTeamDataModel?> onChanged;

  const ReassignBottomSheetWidget({
    Key? key,
    //
    this.selectedDataMember,
    required this.data,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ReassignBottomSheetWidget> createState() =>
      _ReassignBottomSheetWidgetState();
}

class _ReassignBottomSheetWidgetState extends State<ReassignBottomSheetWidget> {
  ReadTeamDataModel? selectedDataMember;

  @override
  void initState() {
    selectedDataMember = widget.selectedDataMember;
    super.initState();
  }

  @override
  void dispose() {
    selectedDataMember = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 2.5.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget(
            context: context,
            title: "Re-assign to",
          ),
          const DottedDividerWidget(),
          SizedBox(height: 1.5.h),
          ..._listViewWidget(),
        ],
      ),
    );
  }

  List<Widget> _listViewWidget() {
    // Guard clause to return empty list widget
    // when data list is empty.
    if (widget.data.isEmpty) {
      return const [
        Center(
          child: Text("Unable to find Team members to re-assign this task."),
        )
      ];
    }

    return widget.data
        .map(
          (eachDataMember) => ListTile(
            title: Text(eachDataMember?.name ?? "-"),
            trailing: selectedDataMember?.id == eachDataMember?.id
                ? const Icon(
                    Icons.check,
                    color: Colors.blue,
                  )
                : null,
            onTap: () {
              setState(() {
                selectedDataMember = eachDataMember;
                widget.onChanged(selectedDataMember);
              });

              // Close the bottom sheet.
              Navigator.of(context).pop();
            },
          ),
        )
        .toList();
  }
}
