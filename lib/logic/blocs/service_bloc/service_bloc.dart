import '../../../data/models/service_models/service_response.dart';
import '../../../data/repositories/service_repository/service_repository.dart';
import 'package:rxdart/rxdart.dart';

class ServiceBloc {
  final ServiceRepository _serviceRepository = ServiceRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ServiceResponse> _subject =
      BehaviorSubject<ServiceResponse>();

  /// Used to fetch new entries.
  getData() async {
    ServiceResponse response = await _serviceRepository.getAPIData();
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

  BehaviorSubject<ServiceResponse> get subject => _subject;
}

final serviceBloc = ServiceBloc();
