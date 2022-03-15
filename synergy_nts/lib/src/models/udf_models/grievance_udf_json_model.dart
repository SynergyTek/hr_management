// ! hardcoding UNDO
// import 'dart:convert';

// import 'birth_and_death_udf_json_model.dart';
// import 'udf_json_model.dart';

// GrievanceUdfJson grievanceUdfJsonFromJson(String str) =>
//     GrievanceUdfJson.fromJson(json.decode(str));

// String grievanceUdfJsonToJson(GrievanceUdfJson data) =>
//     json.encode(data.toJson());

// class GrievanceUdfJson {
//   GrievanceUdfJson({
//     this.synergyTableMapId,
//     this.components,
//     this.columnComponents,
//   });

//   String? synergyTableMapId;
//   List<GrievanceUdfJsonComponent>? components;
//   List<ColumnComponent>? columnComponents;

//   factory GrievanceUdfJson.fromJson(Map<String, dynamic> jsonData) =>
//       GrievanceUdfJson(
//         synergyTableMapId: jsonData["synergyTableMapId"],
//         components: jsonData["components"] == null
//             ? null
//             : List<GrievanceUdfJsonComponent>.from(
//                 jsonData["components"].map((eachComponent) {
//                 if (!eachComponent['input']) {
//                   return GrievanceUdfJsonComponent.fromJson(eachComponent);
//                 }
//                 return GrievanceUdfJsonComponent();
//               })),
//         columnComponents: jsonData["components"] == null
//             ? null
//             : List<ColumnComponent>.from(
//                 jsonData["components"].map((eachComponent) {
//                 if (eachComponent['input']) {
//                   return ColumnComponent.fromJson(eachComponent);
//                 }
//                 return ColumnComponent();
//               })),
//       );

//   Map<String, dynamic> toJson() => {
//         "synergyTableMapId": synergyTableMapId,
//         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
//       };
// }

// class GrievanceUdfJsonComponent {
//   GrievanceUdfJsonComponent({
//     this.label,
//     this.legend,
//     this.title,
//     this.key,
//     this.type,
//     this.input,
//     this.tableView,
//     this.components,
//     this.columnComponents,
//   });

//   String? label;
//   String? legend;
//   String? title;
//   String? key;
//   String? type;
//   bool? input;
//   bool? tableView;
//   List<GrievancePurpleComponent>? components;
//   List<ColumnComponent>? columnComponents;

//   factory GrievanceUdfJsonComponent.fromJson(Map<String, dynamic> json) =>
//       GrievanceUdfJsonComponent(
//         label: json["label"],
//         legend: json["legend"],
//         title: json["title"],
//         key: json["key"],
//         type: json["type"],
//         input: json["input"],
//         tableView: json["tableView"],
//         components: json["components"] == null
//             ? null
//             : List<GrievancePurpleComponent>.from(
//                 json["components"].map((eachComponent) {
//                 if (!eachComponent['input']) {
//                   return GrievancePurpleComponent.fromJson(eachComponent);
//                 }
//                 return GrievancePurpleComponent();
//               })),
//         columnComponents: json["components"] == null
//             ? null
//             : List<ColumnComponent>.from(
//                 json["components"].map((eachComponent) {
//                 if (eachComponent['input']) {
//                   return ColumnComponent.fromJson(eachComponent);
//                 }
//                 return ColumnComponent();
//               })),
//       );

//   Map<String, dynamic> toJson() => {
//         "label": label,
//         "key": key,
//         "type": type,
//         "input": input,
//         "tableView": tableView,
//         "components": components == null
//             ? null
//             : List<dynamic>.from(components!.map((x) => x.toJson())),
//       };
// }

// class GrievancePurpleComponent {
//   GrievancePurpleComponent({
//     this.legend,
//     this.key,
//     this.type,
//     this.label,
//     this.input,
//     this.tableView,
//     this.components,
//     this.columnComponents,
//     this.columns,
//   });

//   String? legend;
//   String? key;
//   String? type;
//   String? label;
//   bool? input;
//   bool? tableView;
//   List<GrievanceFluffyComponent>? components;
//   List<ColumnComponent>? columnComponents;
//   List<Columns>? columns;

//   factory GrievancePurpleComponent.fromJson(Map<String, dynamic> jsonData) =>
//       GrievancePurpleComponent(
//         legend: jsonData["legend"],
//         key: jsonData["key"],
//         type: jsonData["type"],
//         label: jsonData["label"],
//         input: jsonData["input"],
//         tableView: jsonData["tableView"],
//         components: jsonData["components"] == null
//             ? null
//             : List<GrievanceFluffyComponent>.from(
//                 jsonData["components"].map((eachComponent) {
//                 if (eachComponent['columns'] != null ||
//                     eachComponent['components'] != null) {
//                   return GrievanceFluffyComponent.fromJson(eachComponent);
//                 }
//                 return GrievanceFluffyComponent();
//               })),
//         columnComponents: jsonData["components"] == null
//             ? null
//             : List<ColumnComponent>.from(
//                 jsonData["components"].map((eachComponent) {
//                 if (eachComponent['columns'] == null &&
//                     eachComponent['components'] == null) {
//                   return ColumnComponent.fromJson(eachComponent);
//                 }
//                 return ColumnComponent();
//               })),
//         columns: jsonData["columns"] == null
//             ? null
//             : List<Columns>.from(
//                 jsonData["columns"].map((x) => Columns.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "legend": legend,
//         "key": key,
//         "type": type,
//         "label": label,
//         "input": input,
//         "tableView": tableView,
//       };
// }

// class GrievanceFluffyComponent {
//   GrievanceFluffyComponent({
//     this.label,
//     this.input,
//     this.key,
//     this.tableView,
//     this.type,
//     this.columns,
//     this.columnComponents,
//   });

//   String? label;
//   String? key;
//   String? type;
//   bool? input;
//   bool? tableView;
//   List<Columns>? columns;
//   List<ColumnComponent>? columnComponents;

//   factory GrievanceFluffyComponent.fromJson(Map<String, dynamic> json) =>
//       GrievanceFluffyComponent(
//         label: json["label"],
//         key: json["key"],
//         type: json["type"],
//         input: json["input"],
//         tableView: json["tableView"],
//         columns: json["columns"] == null
//             ? null
//             : List<Columns>.from(
//                 json["columns"].map((x) => Columns.fromJson(x))),
//         columnComponents: json["components"] == null
//             ? null
//             : List<ColumnComponent>.from(
//                 json["components"].map((x) => ColumnComponent.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "label": label,
//         "key": key,
//         "type": type,
//         "input": input,
//         "tableView": tableView,
//         "columns": columns == null
//             ? null
//             : List<dynamic>.from(columns!.map((x) => x.toJson())),
//       };
// }
