import 'package:flutter/material.dart';
import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/screens/nts_template_screen/widgets/animated_grid_view_widget.dart';
import 'package:hr_management/ui/widgets/progress_indicator.dart';

class NTSTemplateBodyWidget extends StatefulWidget {
  /// Stream should be of the type:
  /// T.subject.stream.
  /// Example: leaveTempBloc.subject.stream
  final Stream<dynamic> stream;
  final NTSType ntsType;

  NTSTemplateBodyWidget({
    @required this.stream,
    @required this.ntsType,
  });

  @override
  _NTSTemplateBodyWidgetState createState() => _NTSTemplateBodyWidgetState();
}

class _NTSTemplateBodyWidgetState extends State<NTSTemplateBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder(
        stream: widget.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            // if no data is present
            if (snapshot?.data?.data == null || snapshot.data.data == [])
              return Center(
                child: Text("No data available."),
              );

            // List model = widget.ntsType == ntsType.service
            //     ? snapshot.data.data.where((e) => e.templateType == 6).toList()
            //     : snapshot.data.data;

            return AnimatedGridViewWidget(
              model: snapshot.data.data,
              ntsType: widget.ntsType,
            );
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
