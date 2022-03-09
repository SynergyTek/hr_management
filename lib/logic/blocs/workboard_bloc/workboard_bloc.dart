import 'package:hr_management/data/models/workboard_model/workboard_response_model.dart';
import 'package:rxdart/subjects.dart';
import '../../../data/repositories/workboard_repo/abstract_workboard_repo.dart';

class WorkboardBloc {
  final WorkboardRepository _workboardRepository = WorkboardRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<WorkBoardResponseModel> _subjectWorkboardList =
      BehaviorSubject<WorkBoardResponseModel>();

  /// Used to fetch new entries.
  getWorkboardData({
    Map<String, dynamic>? queryparams,
  }) async {
    WorkBoardResponseModel response =
        await _workboardRepository.getWorkboardList(
      queryparams: queryparams,
    );
    _subjectWorkboardList.sink.add(response);
  }

  dispose() {
    _subjectWorkboardList.close();
  }

  BehaviorSubject<WorkBoardResponseModel> get subjectWorkboardList =>
      _subjectWorkboardList;
}

final workboardBloc = WorkboardBloc();
