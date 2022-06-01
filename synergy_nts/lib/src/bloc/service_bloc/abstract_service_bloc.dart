import 'package:rxdart/rxdart.dart';

import '../../constants/api_endpoints.dart';
import '../../models/post_model/post_response.dart';
import '../../models/service_models/service_model.dart';
import '../../models/service_models/service_response.dart';
import '../../repositories/service_repository/abstract_service_repository.dart';
import '../sanitation_tax_bloc/abstract_sanitation_tax_bloc.dart';

export '../../models/service_models/service_model.dart';
export '../../models/service_models/service_response.dart';
export '../../models/post_model/post_response.dart';
export '../../repositories/service_repository/abstract_service_repository.dart';

part 'service_bloc_implementation.dart';

abstract class AbstractServiceBloc {
  /// getServiceDetail: function to get Service Details data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<ServiceResponse?> getServiceDetail({
    Map<String, dynamic>? queryparams,
  });

  /// postServiceData: function to post(Create) Service data in an API
  /// @Params:
  ///   queryparams: It takes a queryparams to post the data.
  ///   userId: It takes a String of UserID to post the data.
  ///   categoryCode: It takes a String of categoryCode to post the data.
  ///   Service: It takes a DataModel for modelling the data.
  ///   isEmployeeService: It takes a bool(Condition) whether its for employee service or customer service.
  Future<PostResponse> postServiceData({
    bool? isEmployeeService,
    String? userId,
    String? categoryCode,
    required Service? service,
  });

  Future<ServiceResponse?> deleteService({
    Map<String, dynamic>? queryparams,
  });

  /// getServiceHomeListData: function to get List Service Home data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<ServiceListResponse?> getServiceHomeListData({
    Map<String, dynamic>? queryparams,
  });

  /// getMyRequestList: function to get MyRequestList data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  // Future<PaginationMyRequestsResponse?> getMyRequestList({
  getMyRequestList({
    Map<String, dynamic>? queryparams,
  });
}
