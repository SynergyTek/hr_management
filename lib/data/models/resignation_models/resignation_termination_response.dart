import './resignation_termination_model.dart';

export './resignation_termination_model.dart';

class ResignationTerminationResponse {
  final List<ResignationTerminationModel>? data;
  String? error;

  ResignationTerminationResponse({
    required this.data,
  });

  ResignationTerminationResponse.fromJson(List response)
      : data = (response)
            .map(
              (i) => ResignationTerminationModel.fromJson(i),
            )
            .toList();

  ResignationTerminationResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
