part of 'abstract_common_bloc.dart';

class CommonBloc extends AbstractCommonBloc{
  final CommonRepository _commonRepository = CommonRepository();

  final BehaviorSubject<CommonListResponse?> _subjectCommonList =
      BehaviorSubject<CommonListResponse?>();

  final BehaviorSubject<RequestTypeListResponse?> _subjectRequestTypeList =
      BehaviorSubject<RequestTypeListResponse?>();

  // final BehaviorSubject<EnumTreeListResponse> _subjectEnumTreeList =
  //     BehaviorSubject<EnumTreeListResponse>();

  @override
  Future<CommonListResponse> getLOVIdNameList({
    Map<String, dynamic>? queryparams,
  }) async {
    CommonListResponse response =
        await _commonRepository.getLOVIdNameList(queryparams: queryparams);
    _subjectCommonList.sink.add(response);
    return response;
  }

  @override
  Future<RequestTypeListResponse> getRequestTypeList({
    Map<String, dynamic>? queryparams,
  }) async {
    RequestTypeListResponse response =
        await _commonRepository.getRequestTypeList(queryparams: queryparams);
    _subjectRequestTypeList.sink.add(response);
    return response;
    // ServiceListResponse response =
    //     await _commonRepository.getServiceHomeListData(queryparams: queryparams);
    // _subjectRequestTypeList.sink.add(response);
  }

  dispose() {
    _subjectCommonList.close();
    _subjectRequestTypeList.close();
  }

  BehaviorSubject<CommonListResponse?> get subjectCommonList =>
      _subjectCommonList;

  BehaviorSubject<RequestTypeListResponse?> get subjectRequestTypeList =>
      _subjectRequestTypeList;
}

final commonBloc = CommonBloc();
