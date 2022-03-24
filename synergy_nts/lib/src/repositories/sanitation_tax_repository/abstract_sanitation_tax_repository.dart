import 'package:dio/dio.dart';
import '../../models/service_models/service_response.dart';

part 'sanitation_tax_repository.dart';

abstract class AbstractSanitationTaxRepository {
  AbstractSanitationTaxRepository();

  Future<ServiceListResponse> getSanitationTaxHomeListData({
    String? endPointValue,
    Map<String, dynamic>? queryparams,
  });
}
