import '../../../data/models/leave_models/leave_res_model.dart';
import '../../../data/repositories/leave_temp_repo/leave_temp_repo.dart';

import 'package:rxdart/rxdart.dart';

class LeaveTempAPIBloc {
  final LeaveTempRepository _apiRepository = LeaveTempRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<LeaveTempResponse> _subject =
      BehaviorSubject<LeaveTempResponse>();

  /// Used to fetch new entries.
  getData() async {
    LeaveTempResponse response = await _apiRepository.getAPIData();
    print("response: $response");
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

  BehaviorSubject<LeaveTempResponse> get subject => _subject;
}

final leaveTempBloc = LeaveTempAPIBloc();
