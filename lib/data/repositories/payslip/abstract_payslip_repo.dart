import '../../models/payslip/payslip_res_model.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'payslip_repo.dart';

abstract class AbstractPayslipRepository {
  AbstractPayslipRepository();

  Future<PayslipResponse> getPaylsipList({
    Map<String, dynamic> queryparams,
  });
}
