import 'package:hr_management/data/models/remote_attendance_models/remote_attendance_response.dart';
import 'package:hr_management/data/repositories/remote_attendance_repository/remote_attendance_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'package:meta/meta.dart';

class RemoteAttendanceBloc {
  final RemoteAttendanceRepository _serviceRepository =
      RemoteAttendanceRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<RemoteAttendanceResponse> _subject =
      BehaviorSubject<RemoteAttendanceResponse>();

  /// Used to fetch new entries.
  getInsertAccessLog({
    @required bool isSignIn,
  }) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["punchingTime"] = DateTime.now().toString();
    queryparams["punchingTye"] = isSignIn ? "0" : "1";

    RemoteAttendanceResponse response = await _serviceRepository.getInsertAccessLog(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  postData() async {}

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getRemoteAttendance call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getRemoteAttendance call.
    // getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<RemoteAttendanceResponse> get subject => _subject;
}

final remoteAttendanceBloc = RemoteAttendanceBloc();
