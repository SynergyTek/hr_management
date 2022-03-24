import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/api_endpoints.dart';
import '../../constants/enums.dart';
import '../../helpers/download_helper/download.dart';
import '../../models/attachment_model/attachment_model.dart';

import '../../models/attachment_nts_models/attachment_nts_response.dart';

part 'attachment_nts_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractAttachmentNTSRepository {
  AbstractAttachmentNTSRepository();

  Future<AttachmentNTSResponse> getAPIData({
    required NTSType ntsType,
    required String ntsId,
  });

  Future<Response<dynamic>> postAttachmentData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
    required AttachmentModel attachmentData,
  });

  Future<AttachmentNTSResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });

  Future<AttachmentNTSResponse> downloadAttachmentData(
      {required String fileValue, required BuildContext context});

  Future<bool> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
