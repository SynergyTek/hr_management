import 'package:rxdart/subjects.dart';

import '../../../data/models/worklist_dashboard/worklist_dashboard_response.dart';
import '../../../data/repositories/worklist_dashboard/abstract_worklist_dashboard_repo.dart';

class WorklistDashboardBloc {
  final WorklistDashboardRepository _worklistDashboardRepository =
      WorklistDashboardRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<WorklistDashboardResponse>
      _subjectWorklistDashboardList =
      BehaviorSubject<WorklistDashboardResponse>();

  final BehaviorSubject<NoteWorklistDashboardResponse>
      _subjectWorklistNoteDashboardList =
      BehaviorSubject<NoteWorklistDashboardResponse>();

  /// Used to fetch new entries.
  getWorklistDashboardData({
    Map<String, dynamic> queryparams, // String userId,
  }) async {
    WorklistDashboardResponse response =
        await _worklistDashboardRepository.getWorklistDashboardCount(
      queryparams: queryparams,
    );
    _subjectWorklistDashboardList.sink.add(response);
  }

  getWorklistDashboardNoteData({
    Map<String, dynamic> queryparams, // String userId,
  }) async {
    NoteWorklistDashboardResponse response =
        await _worklistDashboardRepository.getWorklistDashboardNoteCount(
      queryparams: queryparams,
    );
    _subjectWorklistNoteDashboardList.sink.add(response);
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getWorklistDashboard call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getWorklistDashboard call.
    // getData();
  }

  dispose() {
    _subjectWorklistDashboardList.close();
  }

  BehaviorSubject<WorklistDashboardResponse> get subjectWorklistDashboardList =>
      _subjectWorklistDashboardList;
  BehaviorSubject<NoteWorklistDashboardResponse>
      get subjectWorklistNoteDashboardList => _subjectWorklistNoteDashboardList;
}

final worklistDashboardBloc = WorklistDashboardBloc();
