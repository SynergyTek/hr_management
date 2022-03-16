part of 'abstract_sanitation_tax_bloc.dart';

class SanitationTaxBloc extends AbstractSanitationTaxBloc {
  final SanitationTaxRepository? _sanitationTaxRepository =
      SanitationTaxRepository();

  final BehaviorSubject<ServiceListResponse?> _subjectSanitationTaxList =
      BehaviorSubject<ServiceListResponse?>();

  /// Used to fetch new entries.
  @override
  // Future<ServiceListResponse?> getSanitationTaxHomeListData({
  getSanitationTaxHomeListData({
    String? endPointValue,
    Map<String, dynamic>? queryparams,
  }) async {
    ServiceListResponse? response =
        await _sanitationTaxRepository!.getSanitationTaxHomeListData(
      endPointValue: endPointValue,
      queryparams: queryparams,
    );
    _subjectSanitationTaxList.sink.add(response);
    // return response;
  }

  dispose() {
    _subjectSanitationTaxList.close();
  }

  BehaviorSubject<ServiceListResponse?> get subjectSanitationTaxList =>
      _subjectSanitationTaxList;
}

final sanitationTaxBloc = SanitationTaxBloc();
