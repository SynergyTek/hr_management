import 'package:rxdart/rxdart.dart';

import '../../models/service_models/service_response.dart';
import '../../repositories/sanitation_tax_repository/abstract_sanitation_tax_repository.dart';
part 'sanitation_tax_bloc_implementation.dart';

abstract class AbstractSanitationTaxBloc {
  /// getSanitationTaxHomeListData: function to get data from the API
  /// @Params:
  ///   endPointValue: It takes a String of endPointValue url for various services.
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  // Future<ServiceListResponse?> getSanitationTaxHomeListData({
  getSanitationTaxHomeListData({
    String? endPointValue,
    Map<String, dynamic>? queryparams,
  });
}
