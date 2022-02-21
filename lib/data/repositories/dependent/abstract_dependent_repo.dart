import 'package:dio/dio.dart';
import '../../models/dependent/dependent_res_model.dart';

import '../../../constants/api_endpoints.dart';

part 'dependent_repo.dart';

abstract class AbstractDependentRepository {
  AbstractDependentRepository();

  Future<ReadDependnetResponse> getReadDependantList({
    Map<String, dynamic>? queryparams,
  });

  Future<DependnetDocReqResponse> getReadDependantDocumentRequestList({
    Map<String, dynamic>? queryparams,
  });
}
