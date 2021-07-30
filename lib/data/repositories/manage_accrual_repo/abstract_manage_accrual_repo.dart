
import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/manage_accural/manage_accrual_res_model.dart';

part 'manage_accrual_repo.dart';

// Overview of the repository class.
abstract class AbstractManageAccrualRepository {
  AbstractManageAccrualRepository();

  Future<ManageAccrualResponse> getManageAccrual({
    Map<String, dynamic> queryparams,
  });
}
