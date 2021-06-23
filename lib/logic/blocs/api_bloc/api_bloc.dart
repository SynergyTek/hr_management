import '../../../data/models/api_models/api_response_model.dart';
import '../../../data/repositories/api_repository.dart';
import 'package:rxdart/rxdart.dart';

class APIBloc {
  final APIRepository _apiRepository = APIRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<APIResponse> _subject = BehaviorSubject<APIResponse>();

  /// Used to fetch new entries.
  getData() async {
    APIResponse response = await _apiRepository.getAPIData();
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

  BehaviorSubject<APIResponse> get subject => _subject;
}

final apiBloc = APIBloc();
