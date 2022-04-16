import './termination_model.dart';

export './termination_model.dart';

class TerminationResponse {
  final List<TerminationModel>? data;
  String? error;

  TerminationResponse({
    required this.data,
  });

  TerminationResponse.fromJson(List response)
      : data = (response)
            .map(
              (i) => TerminationModel.fromJson(i),
            )
            .toList();

  TerminationResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
