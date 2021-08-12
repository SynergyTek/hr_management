import 'package:flutter/material.dart';
import '../../../../data/models/nts_template_models/nts_template_model.dart';
import '../../../../data/models/nts_template_tree_list_models/nts_template_tree_list_model.dart';
import '../../../widgets/empty_list_widget.dart';
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
  final String categoryCode;

  NTSTemplateBodyWidget({
    @required this.stream,
    @required this.ntsType,
    this.categoryCode,
  });

  @override
  _NTSTemplateBodyWidgetState createState() => _NTSTemplateBodyWidgetState();
}

class _NTSTemplateBodyWidgetState extends State<NTSTemplateBodyWidget> {
  Map<String, TreeViewModelChildren> _checkedFilterSelectedItemsMap = Map();
  int _selectedIndex = 0;
  List<NTSTemplateModel> templateModels = [];
  List<NTSTemplateModel> _filteredTemplateModels = [];
  List<String> categoryList = [];
  String selectedCategory = "All";

  @override
  void initState() {
    if (widget.categoryCode != null && widget.categoryCode.isNotEmpty) {
      selectedCategory = widget.categoryCode;
    }
    super.initState();
  }

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
            if (snapshot?.data?.data == null || snapshot.data.data == []) {
              return EmptyListWidget();
            }

            templateModels = snapshot.data.data;
            var singleitem =
                templateModels.map((x) => x.templateCategoryName).toList();
            categoryList = singleitem.toSet().toList();

            if (selectedCategory != "All") {
              _filteredTemplateModels = templateModels
                  .where((element) =>
                      element.templateCategoryName == selectedCategory)
                  .toList();
            } else {
              _filteredTemplateModels = templateModels;
            }
            _filteredTemplateModels.sort((a, b) => a.displayName.compareTo(b.displayName));

            return Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _filterWidget(),
                    Expanded(
                      child: AnimatedGridViewWidget(
                        model: _filteredTemplateModels,
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
    if(widget.categoryCode!='Leave'&& widget.categoryCode != 'Adhoc Task')
    {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(selectedCategory,
                style: Theme.of(context).textTheme.headline6),
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _handleFilterOnPressed(),
          ),
      ],
    );
  }
  else{return SizedBox();}
    
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
                title: Text("Select Template Category"),
                trailing: ElevatedButton(
                  // style: ButtonStyle(overl),
                  child: Text(
                    'Reset',
                  ),
                  onPressed: () {
                    setState(() {
                      selectedCategory = "All";
                    });

                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: Icon(
                        Icons.check_box,
                        color: selectedCategory == categoryList[index]
                            ? Theme.of(context).primaryColor
                            : Colors.grey[100],
                      ),
                      title: Text(categoryList[index]),
                      onTap: () {
                        setState(() {
                          selectedCategory = categoryList[index];
                        });
                        Navigator.of(context).pop();
                      },
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
