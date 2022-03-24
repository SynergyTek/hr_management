part of 'abstract_nts_dropdown_bloc.dart';

class NTSDdAPIBloc extends AbstractNTSDropDownBloc {
  final NTSDropdownRepository _apiRepository = NTSDropdownRepository();

  final BehaviorSubject<NTSDropdownResponse?> _subject =
      BehaviorSubject<NTSDropdownResponse?>();

  /// Used to fetch new entries.
  @override
  Future<NTSDropdownResponse> getData({

    required String url,
    required String idKey,
    String? typeKey,
    required String nameKey,
  }) async {
    NTSDropdownResponse response = await _apiRepository.getdynamicUrlData(
      url: url,
      idKey: idKey,
      typeKey: typeKey,
      nameKey: nameKey,
    );
    _subject.sink.add(response);
    return response;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<NTSDropdownResponse?> get subject => _subject;
}

final ntsDdBloc = NTSDdAPIBloc();
