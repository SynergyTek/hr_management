import 'package:rxdart/rxdart.dart';

import '../../../data/models/attendance_view_models/attendance_view_response.dart';
import '../../../data/repositories/attendance_view_repository/attendance_view_repository.dart';

class AttendanceViewBloc {
  final AttendanceViewRepository _apiRepository = AttendanceViewRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<AttendanceViewResponse> _subject =
      BehaviorSubject<AttendanceViewResponse>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic> queryparams,
  }) async {
    AttendanceViewResponse response = await _apiRepository.getAPIData(
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

    // Update the list (in UI) with the getAPI call.
    getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getAPI call.
    getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AttendanceViewResponse> get subject => _subject;
}

final attendanceViewBloc = AttendanceViewBloc();
