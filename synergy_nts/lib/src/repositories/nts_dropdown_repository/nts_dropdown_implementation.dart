part of 'abstract_nts_dropdown_repository.dart';

class NTSDropdownRepository extends AbstractNTSDropdownRepository {
  final Dio _dio = Dio();

  @override
  Future<NTSDropdownResponse> getdynamicUrlData({
    Map<String, dynamic>? queryparams,
    String? url,
    String? idKey,
    String? typeKey,
    String? nameKey,
  }) async {
    try {
      Response response = await _dio.get(
        // APIEndpointConstants.BASE_URL + '/' + url!,
        (url != null && url.contains('EGOV_COMPLAINT_SUB_TYPE'))
            ? APIEndpointConstants.IMAGE_BASE_URL + '/' + url
            // ? 'https://synergydev.aitalkx.com/cms/query/GetLOVIdNameList?lovType=EGOV_COMPLAINT_SUB_TYPE&parentCode=' +
            //     typeKey!
            : APIEndpointConstants.BASE_URL + '/' + url!,
        queryParameters: queryparams,
      );

      return NTSDropdownResponse.fromJson(response.data, idKey!, nameKey!);
    } catch (err, _) {
      return NTSDropdownResponse.withError("$err");
    }
  }

  @override
  Future<NTSDropdownResponse> deleteAPIData(
      {Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<NTSDropdownResponse> postAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  @override
  Future<NTSDropdownResponse> putAPIData({Map<String, dynamic>? queryparams}) {
    throw UnimplementedError();
  }

  Future<NTSDropdownResponse> getFilteredDDData({
    Map<String, dynamic>? queryparams,
    String? url,
    String? idKey,
    String? nameKey,
  }) async {
    try {
      Response response = await _dio.get(
        (url != null && url.contains('EGOV_COMPLAINT_SUB_TYPE'))
            ? APIEndpointConstants.IMAGE_BASE_URL + '/' + url
            // ? 'https://webapidev.aitalkx.com/cms/query/GetLOVIdNameList?lovType=EGOV_COMPLAINT_SUB_TYPE&parentId=ComplaintType&filterKey=Id&filterValue=17932bae-0462-4da4-9c93-d1eb97044f8a'
            : APIEndpointConstants.BASE_URL + '/' + url!,
        queryParameters: queryparams ?? {},
      );

      return NTSDropdownResponse.fromJson(response.data, idKey!, nameKey ?? '');
    } catch (err, _) {
      return NTSDropdownResponse.withError("$err");
    }
  }
}
