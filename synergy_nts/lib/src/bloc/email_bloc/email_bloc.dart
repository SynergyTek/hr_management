import 'package:rxdart/rxdart.dart';

import '../../models/email_model/email_response_model.dart';
import '../../repositories/email_repository/abstract_email_repository.dart';


class EmailBloc {
  final EmailRepository _emailRepository = EmailRepository();

  final BehaviorSubject<EmailResponseModel?> _subjectEmailData =
      BehaviorSubject<EmailResponseModel?>();

  Future<EmailResponseModel?> getReadEmailData({
    Map<String, dynamic>? queryparams,
  }) async {
    EmailResponseModel response =
        await _emailRepository.getReadEmailData(queryparams: queryparams);
    _subjectEmailData.sink.add(response);
    return response;
  }

  BehaviorSubject<EmailResponseModel?> get subjectEmailData =>
      _subjectEmailData;

  dispose() {
    _subjectEmailData.close();
  }
}

final emailBloc = EmailBloc();
