import 'package:rxdart/rxdart.dart';

import '../../../../data/models/documents_models/person_profile_models/person_profile_response.dart';
import '../../../../data/repositories/documents_repository/person_profile_repository/person_profile_repository.dart';

class PersonProfileBloc {
  final PersonProfileRepository _apiRepository = PersonProfileRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<PersonProfileResponse> _subject =
      BehaviorSubject<PersonProfileResponse>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic> queryparams,
  }) async {
    PersonProfileResponse response = await _apiRepository.getAPIData();
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

  BehaviorSubject<PersonProfileResponse> get subject => _subject;
}

final personProfileBloc = PersonProfileBloc();
