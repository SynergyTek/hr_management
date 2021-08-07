import 'package:hr_management/data/models/help_desk_models/open_requests_by_category_response.dart';

import '../../../../data/repositories/case_management_repository/request_chart_status_repository/helpdesk_box_1_repository/request_chart_status_repository.dart';
import 'package:rxdart/rxdart.dart';

class RequestChartStatusBloc {
  final RequestChartStatusRepository _apiRepository =
      RequestChartStatusRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<OpenRequestsByCategoryResponse> _subject =
      BehaviorSubject<OpenRequestsByCategoryResponse>();

  /// Used to fetch new/existing entries.
  getData({
    Map<String, dynamic> queryparams,
  }) async {
    OpenRequestsByCategoryResponse response = await _apiRepository.getAPIData(
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

  BehaviorSubject<OpenRequestsByCategoryResponse> get subject => _subject;
}

final requestChartStatusBloc = RequestChartStatusBloc();
