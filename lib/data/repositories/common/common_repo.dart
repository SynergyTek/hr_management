part of 'abstract_common_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class CommonRepository extends AbstractCommonRepository {
  final Dio _dio = Dio();

  Future<CommonListResponse> getLOVIdNameList(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.GET_LOV_ID_NAME_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return CommonListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return CommonListResponse.withError("$err");
    }
  }

  Future<CommonListResponse> getEnumIdNameList(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.GET_ENUM_ID_NAME_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return CommonListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return CommonListResponse.withError("$err");
    }
  }

  Future<CommonListResponse> getUserIdNameList(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.GET_USER_ID_NAME_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return CommonListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return CommonListResponse.withError("$err");
    }
  }

  Future<OwnerNameListResponse> getOwnerIdNameList(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.GET_OWNER_ID_NAME_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return OwnerNameListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return OwnerNameListResponse.withError("$err");
    }
  }

  Future<EnumTreeListResponse> getEnumAsTreeList(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.GET_ENUM_AS_TREE_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return EnumTreeListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return EnumTreeListResponse.withError("$err");
    }
  }

  Future<EnumTreeListResponse> getModuleTreeList(
      {Map<String, dynamic> queryparams}) async {
    final String endpoint = APIEndpointConstants.GET_MODULE_TREE_LIST;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      //print(response.data);
      return EnumTreeListResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return EnumTreeListResponse.withError("$err");
    }
  }
}
