import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/nts_dropdown/nts_dd_res_model.dart';

part 'nts_dropdown_implementation.dart';

abstract class AbstractNTSDdRepository {
  AbstractNTSDdRepository();

  Future<NTSDdResponse> getdynamicUrlData({
    Map<String, dynamic>? queryparams,
    required String url,
    String? idKey,
    String? nameKey,
  });

  Future<NTSDdResponse> getFilteredDDData({
    Map<String, dynamic>? queryparams,
    required String url,
    String? idKey,
    String? nameKey,
  });
}
