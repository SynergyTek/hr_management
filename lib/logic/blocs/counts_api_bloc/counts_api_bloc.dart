import 'package:hr_management/data/models/counts_api_models/counts_api_response.dart';
import 'package:hr_management/data/repositories/counts_api_repository/counts_api_repository.dart';
import 'package:rxdart/rxdart.dart';

class CountsAPIBloc {
  final CountsAPIRepository _apiRepository = CountsAPIRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<CountsAPIResponse> _subject =
      BehaviorSubject<CountsAPIResponse>();

  /// Used to fetch new entries.
  getData() async {
    CountsAPIResponse response = await _apiRepository.getAPIData();
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  postData() async {}

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getService call.
    getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getService call.
    getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<CountsAPIResponse> get subject => _subject;
}

final countsAPIBloc = CountsAPIBloc();
