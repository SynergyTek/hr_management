import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_response.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_legal_entity_repository/dms_legal_entity_repository.dart';
import 'package:rxdart/rxdart.dart';

class DMSLegalEntityBloc {
  final DMSLegalEntityRepository _apiRepository = DMSLegalEntityRepository();

  final BehaviorSubject<DMSLegalEntityResponse> _subject = BehaviorSubject();

  Future<DMSLegalEntityResponse> getAPIData({
    Map<String, dynamic>? queryparams,
  }) async {
    DMSLegalEntityResponse response = await _apiRepository.getAPIData(
      queryparams: queryparams,
    );

    _subject.sink.add(response);

    return response;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<DMSLegalEntityResponse> get subject => _subject;
}

final dmsLegalEntityBloc = DMSLegalEntityBloc();
