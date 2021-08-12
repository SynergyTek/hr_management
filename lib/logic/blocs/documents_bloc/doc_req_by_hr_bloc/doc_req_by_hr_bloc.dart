import 'package:hr_management/data/models/documents_models/doc_req_by_hr/doc_req_by_hr_response.dart';
import 'package:hr_management/data/repositories/documents_repository/doc_req_by_hr/doc_req_by_hr_repository.dart';
import 'package:rxdart/rxdart.dart';


class DocReqByHrBloc {
  final DocReqByHrRepository _apiRepository = DocReqByHrRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<DocReqByHrResponse> _subject =
      BehaviorSubject<DocReqByHrResponse>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic> queryparams,
  }) async {
    DocReqByHrResponse response = await _apiRepository.getAPIData();
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

  BehaviorSubject<DocReqByHrResponse> get subject => _subject;
}

final docReqByHrBloc = DocReqByHrBloc();
