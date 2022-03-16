import 'package:dio/dio.dart';
import '../../models/attachment_model/attachment_model.dart';
import '../../models/attachment_nts_models/attachment_nts_response.dart';
import '../../repositories/attachment_nts_repository/attachment_nts_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../../constants/enums.dart';

export '../../models/attachment_model/attachment_model.dart';
export '../../models/attachment_nts_models/attachment_nts_response.dart';
export '../../repositories/attachment_nts_repository/attachment_nts_repository.dart';

part 'attachment_nts_bloc_implementation.dart';

abstract class AbstractAttachmentNTSBloc {
  /// GetData: function to get data from the API
  /// @Params:
  ///   NTSType: It takes a enum NTSType. Can be Service, Task or Note.
  ///   NTSId: The id of the selected NTS in the NTSType
  ///   UserId: UserId of the logged in user.
  /// @Returns AttachmentNTSResponse
  Future<AttachmentNTSResponse> getData({
    required NTSType ntsType,
    required String ntsId,
    String? userid,
  });

  Future<String> postAttachmentDocumentData({
    required AttachmentModel attachmentData,
  });

  Future<bool> deleteData({
    Map<String, dynamic>? queryparams,
    required NTSType ntsType,
    required String ntsId,
  });
}
