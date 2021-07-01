class NTSDropdownModel {
  NTSDropdownModel({this.id, this.name});

  String id;
  String name;

  factory NTSDropdownModel.fromJson(
      Map<String, dynamic> json, String idkey, String nameKey) {
    return NTSDropdownModel(
      id: json[idkey],
      name: json[nameKey],
    );
  }

  Map<String, dynamic> toJson(String idkey, String nameKey) => {
        "$idkey": id,
        "$nameKey": name,
      };
}
