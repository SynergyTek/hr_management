import 'package:hr_management/data/models/common/common_list_response.dart';
import 'package:hr_management/data/repositories/common/abstract_common_repo.dart';
import 'package:rxdart/rxdart.dart';

class CommonBloc {
  final CommonRepository _commonRepository = CommonRepository();

  final BehaviorSubject<CommonListResponse> _subjectCommonList =
      BehaviorSubject<CommonListResponse>();
  getLOVList({
    Map<String, dynamic> queryparams,
  }) async {
    CommonListResponse response =
        await _commonRepository.getLOVList(queryparams: queryparams);
    _subjectCommonList.sink.add(response);
  }

  dispose() {
    _subjectCommonList.close();
  }

  BehaviorSubject<CommonListResponse> get subjectCommonList =>
      _subjectCommonList;
}

final commonBloc = CommonBloc();
