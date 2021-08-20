import 'package:hr_management/data/models/dms/dms_folder_str_response.dart';
import 'package:hr_management/data/repositories/dms_repository/abstract_dms_repo.dart';
import 'package:rxdart/rxdart.dart';

class DMSDocBloc {
  final DMSRepository _dmsRepository = DMSRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<DMSFlderStrResponse> _subjectDMSGetFilesResponse =
      BehaviorSubject<DMSFlderStrResponse>();

  /// Used to fetch new entries.
  getReadDependantList({
    Map<String, dynamic> queryparams,
  }) async {
    DMSFlderStrResponse response =
        await _dmsRepository.getReadDependantList(queryparams: queryparams);

    _subjectDMSGetFilesResponse.sink.add(response);
  }

  dispose() {
    _subjectDMSGetFilesResponse.close();
  }

  BehaviorSubject<DMSFlderStrResponse> get subjectReadDependnetResponse =>
      _subjectDMSGetFilesResponse;
}

final dependentBloc = DMSDocBloc();
