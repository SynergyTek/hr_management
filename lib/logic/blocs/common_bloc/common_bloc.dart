import 'package:rxdart/rxdart.dart';

import '../../../data/models/common/common_list_response.dart';
import '../../../data/models/enum_tree/enum_tree_list_response.dart';
import '../../../data/models/owner_name_models.dart/owner_name_list_response.dart';
import '../../../data/repositories/common/abstract_common_repo.dart';

class CommonBloc {
  final CommonRepository _commonRepository = CommonRepository();

  final BehaviorSubject<CommonListResponse> _subjectCommonList =
      BehaviorSubject<CommonListResponse>();

  final BehaviorSubject<OwnerNameListResponse> _subjectOwnerNameList =
      BehaviorSubject<OwnerNameListResponse>();

  final BehaviorSubject<EnumTreeListResponse> _subjectEnumTreeList =
      BehaviorSubject<EnumTreeListResponse>();

  getLOVIdNameList({
    Map<String, dynamic> queryparams,
  }) async {
    CommonListResponse response =
        await _commonRepository.getLOVIdNameList(queryparams: queryparams);
    _subjectCommonList.sink.add(response);
  }

  getEnumIdNameList({
    Map<String, dynamic> queryparams,
  }) async {
    CommonListResponse response =
        await _commonRepository.getEnumIdNameList(queryparams: queryparams);
    _subjectCommonList.sink.add(response);
  }

  getUserIdNameList({
    Map<String, dynamic> queryparams,
  }) async {
    CommonListResponse response =
        await _commonRepository.getUserIdNameList(queryparams: queryparams);
    _subjectCommonList.sink.add(response);
  }

  getOwnerIdNameList({
    Map<String, dynamic> queryparams,
  }) async {
    OwnerNameListResponse response =
        await _commonRepository.getOwnerIdNameList(queryparams: queryparams);
    _subjectOwnerNameList.sink.add(response);
  }

  getEnumAsTreeList({
    Map<String, dynamic> queryparams,
  }) async {
    EnumTreeListResponse response =
        await _commonRepository.getEnumAsTreeList(queryparams: queryparams);
    _subjectEnumTreeList.sink.add(response);
  }

  getModuleTreeList({
    Map<String, dynamic> queryparams,
  }) async {
    EnumTreeListResponse response =
        await _commonRepository.getModuleTreeList(queryparams: queryparams);
    _subjectEnumTreeList.sink.add(response);
  }

  dispose() {
    _subjectCommonList.close();
    _subjectOwnerNameList.close();
    _subjectEnumTreeList.close();
  }

  BehaviorSubject<CommonListResponse> get subjectCommonList =>
      _subjectCommonList;

  BehaviorSubject<OwnerNameListResponse> get subjectOwnerNameList =>
      _subjectOwnerNameList;

  BehaviorSubject<EnumTreeListResponse> get subjectEnumTreeList =>
      _subjectEnumTreeList;
}

final commonBloc = CommonBloc();
