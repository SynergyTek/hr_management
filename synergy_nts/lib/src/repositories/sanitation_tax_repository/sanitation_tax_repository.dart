part of 'abstract_sanitation_tax_repository.dart';

class SanitationTaxRepository extends AbstractSanitationTaxRepository {
  final Dio _dio = Dio();

  @override
  Future<ServiceListResponse> getSanitationTaxHomeListData({
    String? endPointValue,
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        endPointValue ?? '',
        queryParameters: queryparams ?? {},
      );
      return ServiceListResponse.fromJson(
        response.data,
      );
    } catch (err, _) {
      return ServiceListResponse.withError("$err");
    }
  }
}
