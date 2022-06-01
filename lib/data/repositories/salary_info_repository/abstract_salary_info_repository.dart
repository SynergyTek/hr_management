import 'package:dio/dio.dart';
import 'package:hr_management/data/models/salary_info_model/salary_info_response.dart';

import '../../../constants/api_endpoints.dart';

part 'salary_info_repository.dart';

abstract class AbstractSalaryInfoRepository {
  AbstractSalaryInfoRepository();
  Future<SalaryInfoResponse> getSalaryInfo({
    Map<String, dynamic>? queryparams,
  });
}
