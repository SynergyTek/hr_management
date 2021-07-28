import '../../models/enum_tree/enum_tree_list_response.dart';
import '../../models/owner_name_models.dart/owner_name_list_response.dart';
import '../../models/common/common_list_response.dart';
import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'common_repo.dart';

// Overview of the repository class.
abstract class AbstractCommonRepository {
  AbstractCommonRepository();

  Future<CommonListResponse> getLOVIdNameList();

  Future<CommonListResponse> getEnumIdNameList();

  Future<CommonListResponse> getUserIdNameList();

  Future<OwnerNameListResponse> getOwnerIdNameList();

  Future<EnumTreeListResponse> getEnumAsTreeList();

  Future<EnumTreeListResponse> getModuleTreeList();
}
