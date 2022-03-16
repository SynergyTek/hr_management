import 'package:flutter/services.dart';
import '../../bloc/nts_dropdown_bloc/abstract_nts_dropdown_bloc.dart';
import '../../models/nts_dropdown_model/nts_dropdown_model.dart';
import '../../theme/theme_config.dart';

import 'package:flutter/material.dart';

import 'circle_avatar.dart';
import 'custom_progress_indicator.dart';
import 'empty_list_widget.dart';
import 'listizer.dart';

typedef ListTapPressedCallBack = Function(dynamic key);

class MultiselectDropDownList extends StatefulWidget {
  final ListTapPressedCallBack? onListTap;
  final String? url;
  final String? ddName;
  final String? idKey;
  final String? typeKey;
  final String? nameKey;
  final List<NTSDropdownModel>? dynamicList;
  final List<String>? multiSelectDropdownValues;

  const MultiselectDropDownList(
      {this.onListTap,
      this.ddName,
      this.idKey,
      this.typeKey,
      this.nameKey,
      this.url,
      this.dynamicList,
      this.multiSelectDropdownValues,
      Key? key})
      : super(key: key);

  @override
  _MultiselectDropDownList createState() => _MultiselectDropDownList();
}

class _MultiselectDropDownList extends State<MultiselectDropDownList> {
  List<NTSDropdownModel> _idNameModelList = [];
  List<NTSDropdownModel> _filteredIdNameModelList = [];

  List<NTSDropdownModel> _selectList = [];
  List<String> _selectListId = [];

  String? title;

  @override
  void initState() {
    _selectListId = widget.multiSelectDropdownValues!;
    ntsDdBloc.getData(
      url: widget.url!,
      idKey: widget.idKey!,
      typeKey: widget.typeKey,
      nameKey: widget.nameKey!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _selectListId.isEmpty
            ? AppBar(
                title: widget.ddName!.contains('Select')
                    ? Text(widget.ddName!)
                    : Text("Select " + widget.ddName!),
              )
            : AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme: const IconThemeData(color: Colors.grey),
                backgroundColor: Colors.transparent,
                title: Text('${_selectListId.length}'),
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _selectListId = [];
                    });
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.select_all),
                    onPressed: () {
                      _filteredIdNameModelList.forEach((element) {
                        if (!_selectListId.contains(element.id)) {
                          setState(() {
                            _selectListId.add(element.id!);
                          });
                        }
                      });
                    },
                  ),
                  TextButton(
                    child: const Text('Done'),
                    onPressed: () {
                      _idNameModelList.forEach((element) {
                        if (_selectListId.contains(element.id)) {
                          _selectList.add(element);
                        }
                      });
                      if (widget.onListTap != null) {
                        widget.onListTap!(_selectList);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
        body: Container(
          padding: DEFAULT_LARGE_PADDING,
          child: _child(),
        ));
  }

  Widget _child() {
    return StreamBuilder<NTSDropdownResponse?>(
      stream: ntsDdBloc.subject.stream,
      builder: (context, AsyncSnapshot<NTSDropdownResponse?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.data == null || snapshot.data!.data!.isEmpty) {
            return EmptyListWidget();
          }
          _idNameModelList = snapshot.data!.data!;

          return _list();
        } else {
          return const Center(
            child: CustomProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _list() {
    return Listizer(
      listItems: _idNameModelList,
      filteredSearchList: _filteredIdNameModelList,
      itemBuilder: (context, index) {
        if (_filteredIdNameModelList[index].name != null &&
            _filteredIdNameModelList[index].name!.isNotEmpty) {
          return ListTile(
            leading: TextCircleAvater(
                isTick:
                    _selectListId.contains(_filteredIdNameModelList[index].id)
                        ? true
                        : false,
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
              setState(() {
                if (_selectListId
                    .contains(_filteredIdNameModelList[index].id)) {
                  _selectListId.remove(_filteredIdNameModelList[index].id);
                } else {
                  _selectListId.add(_filteredIdNameModelList[index].id!);
                }
              });
            },
          );
        } else {
          return const SizedBox(height: 0);
        }
      },
    );
  }

  @override
  void dispose() {
    _idNameModelList = [];
    _filteredIdNameModelList = [];
    _selectList = [];
    _selectListId = [];
    super.dispose();
  }
}
