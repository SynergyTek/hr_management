class NTSDropdownModel {
  String? id;
  String? name;
  Map<String, dynamic>? extraInfo;

  NTSDropdownModel({
    this.id,
    this.name,
    this.extraInfo,
  });

  factory NTSDropdownModel.fromJson(
      Map<String, dynamic> json, String idkey, String nameKey) {
    return NTSDropdownModel(
      id: json[idkey],
      name: json[nameKey],
    );
  }

  Map<String, dynamic> toJson(String idkey, String nameKey) => {
        idkey: id,
        nameKey: name,
      };
}
