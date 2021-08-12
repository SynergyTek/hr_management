import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../models/read_component_data_model/read_component_resp.dart';

part 'user_repo.dart';

// Overview of the repository class.
abstract class AbstractReadComponentRepository {
  AbstractReadComponentRepository();

  Future<ReadComponentResponse> readComponentData();
}
