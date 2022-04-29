import 'dart:convert';

List<JsonContentModel> jsonContentModelFromJson(String str) => List<JsonContentModel>.from(json.decode(str).map((x) => JsonContentModel.fromJson(x)));

String jsonContentModelToJson(List<JsonContentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JsonContentModel {
    JsonContentModel({
        this.id,
        this.title,
        this.jsonContentModelClass,
        this.item,
        this.sectionDigit,
        this.ownerUserId,
    });

    String? id;
    String? title;
    String? jsonContentModelClass;
    List<dynamic>? item;
    int? sectionDigit;
    String? ownerUserId;

    factory JsonContentModel.fromJson(Map<String, dynamic> json) => JsonContentModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        jsonContentModelClass: json["class"] == null ? null : json["class"],
        item: json["item"] == null ? null : List<dynamic>.from(json["item"].map((x) => x)),
        sectionDigit: json["sectionDigit"] == null ? null : json["sectionDigit"],
        ownerUserId: json["ownerUserId"] == null ? null : json["ownerUserId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "class": jsonContentModelClass == null ? null : jsonContentModelClass,
        "item": item == null ? null : List<dynamic>.from(item!.map((x) => x)),
        "sectionDigit": sectionDigit == null ? null : sectionDigit,
        "ownerUserId": ownerUserId == null ? null : ownerUserId,
    };
}
