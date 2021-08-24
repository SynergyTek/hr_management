import 'package:dio/dio.dart';
import 'package:hr_management/data/models/dms/dms_legal_entity_model/dms_legal_entity_response.dart';

import '../../../../../constants/api_endpoints.dart';

part 'dms_legal_entity_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractDMSLegalEntityRepository {
  AbstractDMSLegalEntityRepository();

  Future<DMSLegalEntityResponse> getAPIData();
}
