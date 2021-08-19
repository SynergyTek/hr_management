import 'package:dio/dio.dart';
import 'package:hr_management/data/models/dms_document/dms_folder_str_response.dart';

import '../../../constants/api_endpoints.dart';

part 'dms_repo.dart';

abstract class AbstractDMSRepository {
  AbstractDMSRepository();

  Future<DMSFlderStrResponse> getReadDependantList({
    Map<String, dynamic> queryparams,
  });
}
