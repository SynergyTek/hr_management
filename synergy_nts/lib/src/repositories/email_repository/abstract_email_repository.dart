import 'package:dio/dio.dart';

import '../../constants/api_endpoints.dart';
import '../../models/email_model/email_response_model.dart';

part 'email_repository.dart';

abstract class AbstractEmailRepository {
  AbstractEmailRepository();

  Future<EmailResponseModel> getReadEmailData({
    Map<String, dynamic>? queryparams,
  });
}
