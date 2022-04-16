import './misconduct_model.dart';

export './misconduct_model.dart';

class MisconductResponse {
  final List<MisconductModel>? data;
  String? error;

  MisconductResponse({
    required this.data,
  });

  MisconductResponse.fromJson(List response)
      : data = (response)
            .map(
              (i) => MisconductModel.fromJson(i),
            )
            .toList();

  MisconductResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
