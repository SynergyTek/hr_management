// ! hardcoding UNDO
// import 'dart:convert';

// import './udf_json_model.dart';
// import 'public_grievance_udf_json_model.dart';

// SewerageConnectionUdfJson sewerageConnectionUdfJsonFromJson(String str) =>
//     SewerageConnectionUdfJson.fromJson(json.decode(str));

// String sewerageConnectionUdfJsonToJson(SewerageConnectionUdfJson data) =>
//     json.encode(data.toJson());

// class SewerageConnectionUdfJson {
//   SewerageConnectionUdfJson({
//     this.synergyTableMapId,
//     this.display,
//     this.components,
//   });

//   String? synergyTableMapId;
//   String? display;
//   List<SewerageConnectionUdfJsonComponent>? components;

//   factory SewerageConnectionUdfJson.fromJson(Map<String, dynamic> json) =>
//       SewerageConnectionUdfJson(
//         synergyTableMapId: json["synergyTableMapId"],
//         display: json["display"],
//         components: List<SewerageConnectionUdfJsonComponent>.from(
//             json["components"]
//                 .map((x) => SewerageConnectionUdfJsonComponent.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "synergyTableMapId": synergyTableMapId,
//         "display": display,
//         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
//       };
// }

// class SewerageConnectionUdfJsonComponent {
//   SewerageConnectionUdfJsonComponent({
//     this.title,
//     this.breadcrumbClickable,
//     this.buttonSettings,
//     this.collapsible,
//     this.key,
//     this.type,
//     this.label,
//     this.input,
//     this.tableView,
//     this.components,
//     this.hidden,
//   });

//   String? title;
//   bool? breadcrumbClickable;
//   ButtonSettings? buttonSettings;
//   bool? collapsible;
//   String? key;
//   String? type;
//   String? label;
//   bool? input;
//   bool? tableView;
//   List<ColumnComponent>? components;
//   bool? hidden;

//   factory SewerageConnectionUdfJsonComponent.fromJson(
//           Map<String, dynamic> json) =>
//       SewerageConnectionUdfJsonComponent(
//         title: json["title"],
//         breadcrumbClickable: json["breadcrumbClickable"],
//         buttonSettings: json["buttonSettings"] == null
//             ? null
//             : ButtonSettings.fromJson(json["buttonSettings"]),
//         collapsible: json["collapsible"],
//         key: json["key"],
//         type: json["type"],
//         label: json["label"],
//         input: json["input"],
//         tableView: json["tableView"],
//         components: List<ColumnComponent>.from(
//           json["components"].map(
//             (x) => ColumnComponent.fromJson(x),
//           ),
//         ),
//         hidden: json["hidden"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "breadcrumbClickable": breadcrumbClickable,
//         "buttonSettings":
//             buttonSettings == null ? null : buttonSettings!.toJson(),
//         "collapsible": collapsible,
//         "key": key,
//         "type": type,
//         "label": label,
//         "input": input,
//         "tableView": tableView,
//         "components": List<dynamic>.from(
//           components!.map(
//             (x) => x.toJson(),
//           ),
//         ),
//         "hidden": hidden,
//       };
// }

// class ButtonSettings {
//   ButtonSettings({
//     this.previous,
//     this.cancel,
//     this.next,
//   });

//   bool? previous;
//   bool? cancel;
//   bool? next;

//   factory ButtonSettings.fromJson(Map<String, dynamic> json) => ButtonSettings(
//         previous: json["previous"],
//         cancel: json["cancel"],
//         next: json["next"],
//       );

//   Map<String, dynamic> toJson() => {
//         "previous": previous,
//         "cancel": cancel,
//         "next": next,
//       };
// }
