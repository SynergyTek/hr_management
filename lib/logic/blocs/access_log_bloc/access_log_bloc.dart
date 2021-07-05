import 'package:hr_management/data/models/access_log/access_log_response.dart';
import 'package:hr_management/data/repositories/access_log/abstract_access_log_repo.dart';
import 'package:rxdart/rxdart.dart';

import 'package:meta/meta.dart';

class AccessLogBloc {
  final AccessLogRepository _accessLogRepository =
      AccessLogRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<AccessLogResponse> _subject =
      BehaviorSubject<AccessLogResponse>();

  /// Used to fetch new entries.
  getInsertAccessLog({
    @required bool isSignIn,
  }) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["punchingTime"] = DateTime.now().toString();
    queryparams["punchingTye"] = isSignIn ? "0" : "1";

    AccessLogResponse response =
        await _accessLogRepository.getInsertAccessLog(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  getAccessLogs() async {
    AccessLogResponse response = await _accessLogRepository.getAccessLogs();
    _subject.sink.add(response);
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
    _subject.close();
  }

  BehaviorSubject<AccessLogResponse> get subject => _subject;
}

final accessLogBloc = AccessLogBloc();
