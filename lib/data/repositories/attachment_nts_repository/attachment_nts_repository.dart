import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../constants/api_endpoints.dart';
import '../../enums/enums.dart';
import '../../models/attachment_nts_models/attachment_nts_response.dart';

part 'attachment_nts_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractAttachmentNTSRepository {
  AbstractAttachmentNTSRepository();

  Future<AttachmentNTSResponse> getAPIData({
    @required NTSType ntsType,
    @required String ntsId,
  });

  Future<AttachmentNTSResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<AttachmentNTSResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<bool> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
