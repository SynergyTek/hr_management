import 'package:flutter/material.dart';
import '../../listizer/listizer.dart';

import '../../../data/models/nts_dropdown/nts_dd_res_model.dart';
import '../../../data/models/nts_dropdown/nts_dropdown_model.dart';
import '../../../logic/blocs/nts_dropdown_bloc/nts_dropdown_api_bloc.dart';
import '../../../themes/theme_config.dart';
import '../appbar_widget.dart';
import '../circle_avatar.dart';
import '../empty_list_widget.dart';
import '../nts_dropdown_select.dart';
import '../progress_indicator.dart';

class DropDownDefaultList extends StatefulWidget {
  final ListTapPressedCallBack? onListTap;
  final String? url;
  final String? ddName;
  final String? idKey;
  final String? nameKey;
  DropDownDefaultList(
      {Key? key,
      this.onListTap,
      this.ddName,
      this.idKey,
      this.nameKey,
      this.url})
      : super(key: key);

  @override
  _DropDownDefaultListState createState() => _DropDownDefaultListState();
}

class _DropDownDefaultListState extends State<DropDownDefaultList> {
  List<NTSDropdownModel> _idNameModelList = [];
  List<NTSDropdownModel> _filteredIdNameModelList = [];
  @override
  void initState() {
    ntsDdBloc
      ..getData(url: widget.url!, idKey: widget.idKey, nameKey: widget.nameKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
          title: "Select " + widget.ddName!,
        ),
        body: Container(
          padding: DEFAULT_LARGE_PADDING,
          child: StreamBuilder<NTSDdResponse?>(
              stream: ntsDdBloc.subject.stream,
              builder: (context, AsyncSnapshot<NTSDdResponse?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.data == null ||
                      snapshot.data!.data.length == 0) {
                    return EmptyListWidget();
                  }
                  _idNameModelList = snapshot.data!.data;
                  return Listizer(
                    showSearchBar: true,
                    listItems: _idNameModelList,
                    filteredSearchList: _filteredIdNameModelList,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: TextCircleAvater(
                            text: _filteredIdNameModelList[index].name,
                            context: context,
                            radius: 20,
                            fontSize: 18,
                            color: Theme.of(context).primaryColorLight),
                        title: Text(
                          _filteredIdNameModelList[index].name != null
                              ? _filteredIdNameModelList[index].name!
                              : "",
                          maxLines: 2,
                        ),
                        onTap: () {
                          if (widget.onListTap != null) {
                            widget.onListTap!(_filteredIdNameModelList[index]);
                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CustomProgressIndicator(),
                  );
                }
              }),
        ));
  }

  @override
  void dispose() {
    _idNameModelList = [];
    _filteredIdNameModelList = [];
    super.dispose();
  }
}
