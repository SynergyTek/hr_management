import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/nts_template_models/nts_template_response.dart';
import 'package:hr_management/data/repositories/nts_template_repository/nts_template_repository.dart';
import 'package:rxdart/rxdart.dart';

class NTSTemplateBloc {
  final NTSTemplateRepository _apiRepository = NTSTemplateRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<NTSTemplateResponse> _subject =
      BehaviorSubject<NTSTemplateResponse>();

  /// Used to fetch new entries.
  getData({
    String categoryCode,
    NTSType ntsType,
    Map<String, dynamic> queryparams,
  }) async {
    if (ntsType == NTSType.service) {
      _subject.sink.add(null);
      queryparams = {
        "categoryCode": categoryCode,
        "templateType": "Service",
      };
    } else if (ntsType == NTSType.task) {
      _subject.sink.add(null);
      queryparams = {
        "categoryCode": categoryCode,
        "templateType": "Task",
        "taskType": "StepTask",
      };
    }

    NTSTemplateResponse response = await _apiRepository.getAPIData(
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

  BehaviorSubject<NTSTemplateResponse> get subject => _subject;
}

final ntsTemplateBloc = NTSTemplateBloc();
