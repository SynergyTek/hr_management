import 'package:flutter/material.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/models/nts_template_tree_list_models/nts_template_tree_list_response.dart';
import '../../../../logic/blocs/nts_template_tree_list_bloc/nts_template_tree_list_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

class TestScreenBodyWidget extends StatefulWidget {
  final NTSType ntsType;

  TestScreenBodyWidget({
    required this.ntsType,
  });

  @override
  _TestScreenBodyWidgetState createState() => _TestScreenBodyWidgetState();
}

class _TestScreenBodyWidgetState extends State<TestScreenBodyWidget> {
  @override
  void initState() {
    super.initState();

    ntsTemplateTreeListBloc..getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<NTSTemplateTreeListResponse>(
        stream: ntsTemplateTreeListBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _testWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _testWidget(List? data) {
    return Container();
  }
}
