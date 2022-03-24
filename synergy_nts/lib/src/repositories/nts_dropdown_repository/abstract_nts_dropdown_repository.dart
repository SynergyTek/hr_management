import 'package:dio/dio.dart';

import '../../constants/api_endpoints.dart';
import '../../models/nts_dropdown_model/nts_dropdown_response.dart';

part 'nts_dropdown_implementation.dart';

// Overview of the repository class.
abstract class AbstractNTSDropdownRepository {
  AbstractNTSDropdownRepository();

  Future<NTSDropdownResponse> getdynamicUrlData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSDropdownResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSDropdownResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSDropdownResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
