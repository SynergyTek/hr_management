import 'package:flutter/material.dart';
import 'package:hr_management/data/models/nts_template_models/nts_template_model.dart';
import 'package:hr_management/data/models/nts_template_tree_list_models/nts_template_tree_list_model.dart';
import 'package:hr_management/ui/widgets/empty_list_widget.dart';
import '../../../../data/enums/enums.dart';
import '../../../../themes/theme_config.dart';
import 'animated_grid_view_widget.dart';
import '../../../widgets/progress_indicator.dart';

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
  Map<String, TreeViewModelChildren> _checkedFilterSelectedItemsMap = Map();
  int _selectedIndex = 0;
  List<NTSTemplateModel> templateModel = [];
  List<String> categoryList = [];

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
              return EmptyListWidget();
            var singleitem =
                templateModel.map((x) => x.templateCategoryName).toList();
            categoryList = singleitem.toSet().toList();

            return Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _filterWidget(),
                    Expanded(
                      child: AnimatedGridViewWidget(
                        model: snapshot.data.data,
                        ntsType: widget.ntsType,
                      ),
                    ),
                  ],
                ),
              ),
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

  Widget _filterWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Expanded(
        //     // child: _handleFilterChips(),
        //     ),
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () => _handleFilterOnPressed(),
        ),
      ],
    );
  }

  _handleFilterChips() {}

  _handleFilterOnPressed() {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                16.0,
              ),
              topRight: Radius.circular(
                16.0,
              ),
            ),
          ),
          width: double.infinity,
          padding: DEFAULT_LARGE_PADDING,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.filter_list),
                title: Text("Filter"),
                trailing: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(categoryList[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _eachItemExpansionTile(NTSTemplateModel eachData) {
    return ExpansionTile(
      title: Text(eachData.name),
      // children: _expansionTileChildren(eachData),
    );
  }
}
