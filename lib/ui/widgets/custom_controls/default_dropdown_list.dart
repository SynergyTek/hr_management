import 'package:flutter/material.dart';
import '../../../data/models/work_book_models/get_note_book_report_model.dart';
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
  final List<NtsItem>? workbookReferenceList;
  DropDownDefaultList({
    Key? key,
    this.onListTap,
    this.ddName,
    this.idKey,
    this.nameKey,
    this.url,
    this.workbookReferenceList,
  }) : super(key: key);

  @override
  _DropDownDefaultListState createState() => _DropDownDefaultListState();
}

class _DropDownDefaultListState extends State<DropDownDefaultList> {
  List<NTSDropdownModel> _idNameModelList = [];
  List<NTSDropdownModel> _filteredIdNameModelList = [];
  List<NtsItem> _idWorkBookList = [];

  @override
  void initState() {
    if (widget.url != null) {
      ntsDdBloc
        ..getData(
            url: widget.url ?? '',
            idKey: widget.idKey,
            nameKey: widget.nameKey);
    } else if (widget.workbookReferenceList != null &&
        widget.workbookReferenceList!.isNotEmpty) {
      _idWorkBookList = widget.workbookReferenceList!;
    }
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
          child: _child(),
        ));
  }

  Widget _child() {
    if (widget.workbookReferenceList != null &&
        widget.workbookReferenceList!.isNotEmpty) {
      return _workbookReferenceList();
    } else {
      return StreamBuilder<NTSDdResponse?>(
        stream: ntsDdBloc.subject.stream,
        builder: (context, AsyncSnapshot<NTSDdResponse?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.data == null ||
                snapshot.data!.data.length == 0) {
              return EmptyListWidget();
            }
            _idNameModelList = snapshot.data!.data;
            return _list();
          } else {
            return Center(
              child: CustomProgressIndicator(),
            );
          }
        },
      );
    }
  }

  Widget _list() {
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
            color: Theme.of(context).primaryColorLight,
          ),
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
  }

  Widget _workbookReferenceList() {
    List _dataList = _idWorkBookList;
    List _filteredDataList = [];
    return Listizer(
      listItems: _dataList,
      filteredSearchList: _filteredDataList,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            _filteredDataList[index].itemNo,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          title: Text(
            _filteredDataList[index].subject != null
                ? _filteredDataList[index].subject!
                : "",
            maxLines: 2,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _filteredDataList[index].ntsNo != null
                  ? _filteredDataList[index].ntsNo!
                  : "",
              maxLines: 2,
            ),
          ),
          onTap: () {
            if (widget.onListTap != null) {
              widget.onListTap!(_filteredDataList[index]);
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _idNameModelList = [];
    _filteredIdNameModelList = [];
    _idWorkBookList = [];
    super.dispose();
  }
}
