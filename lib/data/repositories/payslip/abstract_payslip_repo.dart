import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/payslip/payslip_res_model.dart';

part 'payslip_repo.dart';

abstract class AbstractPayslipRepository {
  AbstractPayslipRepository();

  Future<PayslipResponse> getPaylsipList({
    Map<String, dynamic>? queryparams,
  });
}
