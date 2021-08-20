class FileOperationModel {
  String action;
  String path;
  bool showHiddenItems;
  List data;
  String userId;

  FileOperationModel({
    this.action,
    this.path,
    this.showHiddenItems,
    this.data,
    this.userId,
  });

  FileOperationModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    path = json['path'];
    showHiddenItems = json['showHiddenItems'];
    if (json['data'] != null) {
      data = [];

      json['data'].forEach((v) {
        // TODO: ROSHAN's model.
        // data.add(new ROSHAN's Model goes here.fromJson(v));
      });
    }
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['path'] = this.path;
    data['showHiddenItems'] = this.showHiddenItems;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['userId'] = this.userId;
    return data;
  }
}
