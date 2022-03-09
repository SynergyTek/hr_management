import '../../../data/models/component_result_models/component_result_response.dart';
import '../../../data/repositories/component_result_repository/component_result_repository.dart';

import 'package:rxdart/rxdart.dart';

class ComponentResultBloc {
  final ComponentResultRepository _apiRepository = ComponentResultRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ComponentResultResponse> _subject =
      BehaviorSubject<ComponentResultResponse>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic>? queryparams,
  }) async {
    ComponentResultResponse response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  postData() async {}

  /// Used to update an existing entry.
  putData() async {}

  /// Used to delete a particular entry.
  deleteData() async {}

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ComponentResultResponse> get subject => _subject;
}

final componentResultBloc = ComponentResultBloc();
