import 'package:meta/meta.dart';

import 'attachment_nts_model.dart';

class AttachmentNTSResponse {
  String error;
  List<AttachmentNTSModel> data;

  AttachmentNTSResponse({
    @required this.data,
  });

  AttachmentNTSResponse.fromJson(List response)
      : data = response.map((i) => new AttachmentNTSModel.fromJson(i)).toList(),
        error = "";

  AttachmentNTSResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
