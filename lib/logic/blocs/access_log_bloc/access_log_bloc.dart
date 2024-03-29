import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/models/access_log/access_log_response.dart';
import '../../../data/repositories/access_log/abstract_access_log_repo.dart';

class AccessLogBloc {
  final AccessLogRepository _accessLogRepository = AccessLogRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<AccessLogResponse> _insertAccessLogSubject =
      BehaviorSubject<AccessLogResponse>();

  final BehaviorSubject<AccessLogListDataResponse>
      _getAccessLogListDataSubject =
      BehaviorSubject<AccessLogListDataResponse>();

  /// Used to insert new entries.
  Future<AccessLogResponse> getInsertAccessLog({
    required bool isSignIn,
    required String userId,
    required double latitude,
    required double longitude,
    required String location,
  }) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["punchingTime"] = DateTime.now().toString();
    queryparams["punchingType"] = isSignIn ? "0" : "1";
    queryparams["userId"] = userId;
    queryparams["Latitude"] = latitude;
    queryparams["Longitude"] = longitude;
    queryparams["Location"] = location;

    AccessLogResponse response = await _accessLogRepository.getInsertAccessLog(
      queryparams: queryparams,
    );
    _insertAccessLogSubject.sink.add(response);

    return response;
  }

  /// getAccessLogsListData: is used to fetch all access log data for a particular period.
  getAccessLogsListData({
    Map<String, dynamic>? queryparams,
  }) async {
    AccessLogListDataResponse response =
        await _accessLogRepository.getAccessLogsListData(
      queryparams: queryparams ?? {},
    );
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
