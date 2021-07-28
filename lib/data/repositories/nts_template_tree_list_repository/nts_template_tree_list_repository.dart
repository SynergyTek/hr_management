import '../../../constants/api_endpoints.dart';
import 'package:dio/dio.dart';
import '../../models/nts_template_tree_list_models/nts_template_tree_list_response.dart';

part 'nts_template_tree_list_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractNTSTemplateTreeListRepository {
  AbstractNTSTemplateTreeListRepository();

  Future<NTSTemplateTreeListResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSTemplateTreeListResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSTemplateTreeListResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<NTSTemplateTreeListResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
