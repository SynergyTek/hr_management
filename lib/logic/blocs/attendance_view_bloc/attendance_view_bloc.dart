import 'package:hr_management/data/models/roaster_scheduler_list_model/roaster_scheduler_list_response.dart';
import 'package:hr_management/data/models/user_location_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/models/attendance_view_models/attendance_view_response.dart';
import '../../../data/models/user_geo_location_model/user_geo_location_response.dart';
import '../../../data/repositories/attendance_view_repository/attendance_view_repository.dart';

class AttendanceViewBloc {
  final AttendanceViewRepository _apiRepository = AttendanceViewRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<AttendanceViewResponse> _subject =
      BehaviorSubject<AttendanceViewResponse>();

  final BehaviorSubject<RoasterSchedulerListResponse?>
      _subjectRoasterScheduler =
      BehaviorSubject<RoasterSchedulerListResponse?>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic>? queryparams,
  }) async {
    AttendanceViewResponse response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  postInsertEmployeeTracking({
    Map<String, dynamic>? queryparams,
    List<UserLocation>? data,
  }) async {
    AttendanceViewResponse response =
        await _apiRepository.postInsertEmployeeTracking(
      queryparams: queryparams,
      data: data,
    );
    _subject.sink.add(response);
  }

  getEmployeeTrackingByDate({
    Map<String, dynamic>? queryparams,
  }) async {
    AttendanceViewResponse response =
        await _apiRepository.getEmployeeTrackingByDate(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  Future<UserGeolocationResponse> getUserGeoLocation({
    Map<String, dynamic>? queryparams,
  }) async {
    UserGeolocationResponse response = await _apiRepository.getUserGeoLocation(
      queryparams: queryparams,
    );
    return response;
  }

  Future<RoasterSchedulerListResponse> getRoasterSchedulerList({
    Map<String, dynamic>? queryparams,
  }) async {
    _subjectRoasterScheduler.sink.add(null);
    RoasterSchedulerListResponse response =
        await _apiRepository.getRoasterSchedulerList(
      queryparams: queryparams,
    );
    _subjectRoasterScheduler.sink.add(response);
    return response;
  }

  Future<bool> getPostTaskTimeEntry({
    Map<String, dynamic>? queryparams,
  }) async {
    bool response = await _apiRepository.getPostTaskTimeEntry(
      queryparams: queryparams,
    );
    return response;
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
    _subjectRoasterScheduler.close();
  }

  BehaviorSubject<AttendanceViewResponse> get subject => _subject;
  BehaviorSubject<RoasterSchedulerListResponse?> get subjectRoasterScheduler =>
      _subjectRoasterScheduler;
}

final attendanceViewBloc = AttendanceViewBloc();
