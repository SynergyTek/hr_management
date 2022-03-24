import 'package:rxdart/rxdart.dart';

import '../../models/nts_dropdown_model/nts_dropdown_response.dart';
import '../../repositories/nts_dropdown_repository/abstract_nts_dropdown_repository.dart';
export '../../repositories/nts_dropdown_repository/abstract_nts_dropdown_repository.dart';
export '../../models/nts_dropdown_model/nts_dropdown_response.dart';

part 'nts_dropdown_bloc_implementation.dart';

abstract class AbstractNTSDropDownBloc {
  /// getData: function to get Dropdown data from the API
  /// @Params:
  ///   url: It takes a String of Dynamic url for the DropDown Values.
  ///   idKey: It takes a String of idKey for the DropDown Values.
  ///   typeKey: It takes a String of typeKey for the DropDown Values.
  ///   nameKey: It takes a String of nameKey for the DropDown Values.
  Future<NTSDropdownResponse> getData({
    required String url,
    required String idKey,
    String? typeKey,
    required String nameKey,
  });
}
