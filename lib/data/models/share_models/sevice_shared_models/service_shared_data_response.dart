import 'service_shared_data_model.dart';

class ServiceSharedDataResponse {
  bool isSuccess;
  List<ServiceSharedDataModel> list;
  String error;

  ServiceSharedDataResponse({this.list});

  ServiceSharedDataResponse.fromJson(List response)
      : list =
            (response).map((i) => new ServiceSharedDataModel.fromJson(i)).toList();

  ServiceSharedDataResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
