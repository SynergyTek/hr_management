import 'package:flutter/material.dart';

import '../bloc/nts_dropdown_bloc/abstract_nts_dropdown_bloc.dart';
import '../models/nts_dropdown_model/nts_dropdown_model.dart';

Future<List<NTSDropdownModel>> getMultiSelectList({
  String? udfValue,
  String? idKey,
  String? nameKey,
  String? url,
  TextEditingController? ddController,
}) async {
  String _data = udfValue!;
  List<String> _multiSelectListName = [];

  NTSDropdownResponse _response = await ntsDdBloc.getData(
    url: url!,
    idKey: idKey!,
    typeKey: '',
    nameKey: nameKey!,
  );

  List<NTSDropdownModel>? _filteredList = _response.data
      ?.where((element) => _data.contains('${element.id}'))
      .toList();

  // for (NTSDropdownModel element in _filteredList ?? []) {
  //   if (element.name == null || element.name!.isEmpty) continue;
  //   _multiSelectListName.add(element.name!);
  // }

  return _filteredList!;
}

Future<List<String>> getMultiSelectListNames({
  String? udfValue,
  String? idKey,
  String? nameKey,
  String? url,
  TextEditingController? ddController,
}) async {
  String _data = udfValue!;
  List<String> _multiSelectListName = [];

  NTSDropdownResponse _response = await ntsDdBloc.getData(
    url: url!,
    idKey: idKey!,
    typeKey: '',
    nameKey: nameKey!,
  );

  List<NTSDropdownModel>? _filteredList = _response.data
      ?.where((element) => _data.contains('${element.id}'))
      .toList();

  for (NTSDropdownModel element in _filteredList ?? []) {
    if (element.name == null || element.name!.isEmpty) continue;
    _multiSelectListName.add(element.name!);
  }

  return _multiSelectListName;
}
