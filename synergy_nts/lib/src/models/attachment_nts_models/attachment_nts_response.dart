import 'attachment_nts_model.dart';

class AttachmentNTSResponse {
  List<AttachmentNTSModel> data;
  String? error;

  AttachmentNTSResponse({
    required this.data,
  });

  AttachmentNTSResponse.fromJson(List response)
      : data = response.map((i) => AttachmentNTSModel.fromJson(i)).toList(),
        error = null;

  AttachmentNTSResponse.withError(String errorValue)
      : data = <AttachmentNTSModel>[],
        error = errorValue;
}
