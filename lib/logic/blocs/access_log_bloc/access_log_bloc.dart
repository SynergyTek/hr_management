import '../../../data/models/access_log/access_log_response.dart';
import '../../../data/repositories/access_log/abstract_access_log_repo.dart';
import 'package:rxdart/rxdart.dart';

import 'package:meta/meta.dart';

class AccessLogBloc {
  final AccessLogRepository _accessLogRepository = AccessLogRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<AccessLogResponse> _insertAccessLogSubject =
      BehaviorSubject<AccessLogResponse>();

  final BehaviorSubject<AccessLogListDataResponse>
      _getAccessLogListDataSubject =
      BehaviorSubject<AccessLogListDataResponse>();

  /// Used to insert new entries.
  getInsertAccessLog({
    @required bool isSignIn,
  }) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["punchingTime"] = DateTime.now().toString();
    queryparams["punchingType"] = isSignIn ? "0" : "1";

    AccessLogResponse response = await _accessLogRepository.getInsertAccessLog(
      queryparams: queryparams,
    );
    _insertAccessLogSubject.sink.add(response);
  }

  /// getAccessLogsListData: is used to fetch all access log data for a particular period.
  getAccessLogsListData({
    Map<String, dynamic> queryparams,
  }) async {
    // adding default values.
    if (queryparams == null) {
      // startDate=2021-06-20 00:00:00.000&dueDate=2021-07-06 00:00:00.000
      queryparams = {
        'startdate': DateTime.now(),
      };
    }

    AccessLogListDataResponse response = await _accessLogRepository
        .getAccessLogsListData(queryparams: queryparams);
    _getAccessLogListDataSubject.sink.add(response);
  }

  /// Used to create new entries.
  postData() async {}

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getAccessLog call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getAccessLog call.
    // getData();
  }

  dispose() {
    _insertAccessLogSubject.close();
    _getAccessLogListDataSubject.close();
  }

  BehaviorSubject<AccessLogResponse> get subject => _insertAccessLogSubject;
  BehaviorSubject<AccessLogListDataResponse> get getAccessLogListDataSubject =>
      _getAccessLogListDataSubject;
}

final accessLogBloc = AccessLogBloc();
