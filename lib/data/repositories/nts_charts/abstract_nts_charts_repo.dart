import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
// import '../../enums/enums.dart';
import '../../models/nts_charts/nts_charts_response.dart';
import 'package:synergy_nts/synergy_nts.dart';

part 'nts_charts_repo.dart';

// Overview of the repository class.
abstract class AbstractNTSChartRepository {
  AbstractNTSChartRepository();

  Future<ChartResponse> getChartByStatus(
      {Map<String, dynamic>? queryparams, NTSType? ntsType});

  Future<ChartResponse> getChartByUserType(
      {Map<String, dynamic>? queryparams, NTSType? ntsType});

  Future<ChartResponse> getDatewiseSLA(
      {Map<String, dynamic>? queryparams, NTSType? ntsType});
}
