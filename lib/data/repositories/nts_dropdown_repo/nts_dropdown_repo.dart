import 'package:hr_management/data/models/nts_dropdown/nts_dd_res_model.dart';

import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'nts_dropdown_implementation.dart';

// Overview of the repository class.
abstract class AbstractNTSDdRepository {
  AbstractNTSDdRepository();

  Future<NTSDdResponse> getdynamicUrlData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSDdResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSDdResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSDdResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
