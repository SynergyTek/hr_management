import 'package:rxdart/rxdart.dart';

import '../../../data/models/nts_template_tree_list_models/nts_template_tree_list_response.dart';
import '../../../data/repositories/nts_template_tree_list_repository/nts_template_tree_list_repository.dart';

class NTSTemplateTreeListBloc {
  final NTSTemplateTreeListRepository _apiRepository =
      NTSTemplateTreeListRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<NTSTemplateTreeListResponse> _subject =
      BehaviorSubject<NTSTemplateTreeListResponse>();

  /// Used to fetch new entries.
  getData({
    Map<String, dynamic> queryparams,
  }) async {
    NTSTemplateTreeListResponse response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );
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

  BehaviorSubject<NTSTemplateTreeListResponse> get subject => _subject;
}

final ntsTemplateTreeListBloc = NTSTemplateTreeListBloc();
