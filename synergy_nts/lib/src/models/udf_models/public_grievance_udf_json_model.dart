// ! hardcoding UNDO
// import 'dart:convert';

// import './udf_json_model.dart';

// PublicGrievanceUdfJson publicGrievanceUdfJsonFromJson(String str) =>
//     PublicGrievanceUdfJson.fromJson(json.decode(str));

// String publicGrievanceUdfJsonToJson(PublicGrievanceUdfJson data) =>
//     json.encode(data.toJson());

// class PublicGrievanceUdfJson {
//   PublicGrievanceUdfJson({
//     this.synergyTableMapId,
//     this.display,
//     this.components,
//   });

//   String? synergyTableMapId;
//   String? display;
//   List<PublicGrievanceUdfJsonComponent>? components;

//   factory PublicGrievanceUdfJson.fromJson(Map<String, dynamic> json) =>
//       PublicGrievanceUdfJson(
//         synergyTableMapId: json["synergyTableMapId"],
//         display: json["display"],
//         components: List<PublicGrievanceUdfJsonComponent>.from(
//             json["components"]
//                 .map((x) => PublicGrievanceUdfJsonComponent.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "synergyTableMapId": synergyTableMapId,
//         "display": display,
//         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
//       };
// }

// class PublicGrievanceUdfJsonComponent {
//   PublicGrievanceUdfJsonComponent(
//       {this.title,
//       this.breadcrumbClickable,
//       this.buttonSettings,
//       this.collapsible,
//       this.key,
//       this.type,
//       this.label,
//       this.input,
//       this.tableView,
//       this.components,
//       this.columnComponents});

//   String? title;
//   bool? breadcrumbClickable;
//   ButtonSettings? buttonSettings;
//   bool? collapsible;
//   String? key;
//   String? type;
//   String? label;
//   bool? input;
//   bool? tableView;
//   List<PublicGrievanceComponentComponent>? components;
//   List<ColumnComponent>? columnComponents;

//   factory PublicGrievanceUdfJsonComponent.fromJson(Map<String, dynamic> json) =>
//       PublicGrievanceUdfJsonComponent(
//         columnComponents: json["components"] == null
//             ? null
//             : List<ColumnComponent>.from(
//                 json["components"].map((x) => ColumnComponent.fromJson(x))),
//         title: json["title"],
//         breadcrumbClickable: json["breadcrumbClickable"],
//         buttonSettings: ButtonSettings.fromJson(json["buttonSettings"] ?? {}),
//         collapsible: json["collapsible"],
//         key: json["key"],
//         type: json["type"],
//         label: json["label"],
//         input: json["input"],
//         tableView: json["tableView"],
//         components: List<PublicGrievanceComponentComponent>.from(
//           json["components"] == null
//               ? {}
//               : json["components"]!.map(
//                   (x) => PublicGrievanceComponentComponent.fromJson(x),
//                 ),
//         ),
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "breadcrumbClickable": breadcrumbClickable,
//         "buttonSettings": buttonSettings!.toJson(),
//         "collapsible": collapsible,
//         "key": key,
//         "type": type,
//         "label": label,
//         "input": input,
//         "tableView": tableView,
//         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
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

// class PublicGrievanceComponentComponent {
//   PublicGrievanceComponentComponent({
//     this.label,
//     this.columns,
//     this.key,
//     this.type,
//     this.input,
//     this.tableView,
//     this.autoExpand,
//     this.ntsType,
//     this.editableContext,
//     this.viewableContext,
//     this.viewableBy,
//     this.editableBy,
//     this.columnMetadataId,
//     this.udfValue,
//     this.storage,
//     this.url,
//     this.webcam,
//     this.fileTypes,
//     this.hidden,
//     this.disabled,
//     this.validate,
//     this.components,
//   });

//   String? label;
//   String? key;
//   String? type;
//   bool? input;
//   bool? tableView;
//   bool? autoExpand;
//   NtsType? ntsType;
//   String? columnMetadataId;
//   String? udfValue;
//   String? storage;
//   String? url;
//   bool? webcam;
//   bool? hidden;
//   bool? disabled;
//   FluffyValidate? validate;
//   List<PublicGrievanceColumns>? columns;
//   List<EditableContext>? editableContext;
//   List<ViewableContext>? viewableContext;
//   List<ViewableBy>? viewableBy;
//   List<EditableBy>? editableBy;
//   List<FileTypeData>? fileTypes;
//   List<ColumnComponent>? components;

//   factory PublicGrievanceComponentComponent.fromJson(
//           Map<String, dynamic> json) =>
//       PublicGrievanceComponentComponent(
//         components: json["components"] == null
//             ? null
//             : List<ColumnComponent>.from(
//                 json["components"].map((x) => ColumnComponent.fromJson(x))),
//         label: json["label"],
//         columns: json["columns"] == null
//             ? null
//             : List<PublicGrievanceColumns>.from(
//                 json["columns"].map((x) => PublicGrievanceColumns.fromJson(x))),
//         key: json["key"],
//         type: json["type"],
//         input: json["input"],
//         tableView: json["tableView"],
//         autoExpand: json["autoExpand"] ?? json["autoExpand"],
//         ntsType:
//             json["ntsType"] == null ? null : ntsTypeValues.map[json["ntsType"]],
//         editableContext: json["editableContext"] == null
//             ? null
//             : List<EditableContext>.from(json["editableContext"]
//                 .map((x) => editableContextValues.map[x])),
//         viewableContext: json["viewableContext"] == null
//             ? null
//             : List<ViewableContext>.from(json["viewableContext"]
//                 .map((x) => viewableContextValues.map[x])),
//         viewableBy: json["viewableBy"] == null
//             ? null
//             : List<ViewableBy>.from(
//                 json["viewableBy"].map((x) => viewableByValues.map[x])),
//         editableBy: json["editableBy"] == null
//             ? null
//             : List<EditableBy>.from(
//                 json["editableBy"].map((x) => editableByValues.map[x])),
//         columnMetadataId: json["columnMetadataId"] ?? json["columnMetadataId"],
//         udfValue: json["udfValue"],
//         storage: json["storage"] ?? json["storage"],
//         url: json["url"] ?? json["url"],
//         webcam: json["webcam"] ?? json["webcam"],
//         fileTypes: json["fileTypes"] == null
//             ? null
//             : List<FileTypeData>.from(
//                 json["fileTypes"].map(
//                   (x) => FileTypeData.fromJson(x),
//                 ),
//               ),
//         hidden: json["hidden"] ?? json["hidden"],
//         disabled: json["disabled"] ?? json["disabled"],
//         validate: json["validate"] == null
//             ? null
//             : FluffyValidate.fromJson(json["validate"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "label": label,
//         "columns": columns == null
//             ? null
//             : List<dynamic>.from(columns!.map((x) => x.toJson())),
//         "key": key,
//         "type": type,
//         "input": input,
//         "tableView": tableView,
//         "autoExpand": autoExpand,
//         "ntsType": ntsType == null ? null : ntsTypeValues.reverse[ntsType],
//         "editableContext": editableContext == null
//             ? null
//             : List<dynamic>.from(
//                 editableContext!.map((x) => editableContextValues.reverse[x])),
//         "viewableContext": viewableContext == null
//             ? null
//             : List<dynamic>.from(
//                 viewableContext!.map((x) => viewableContextValues.reverse[x])),
//         "viewableBy": viewableBy == null
//             ? null
//             : List<dynamic>.from(
//                 viewableBy!.map((x) => viewableByValues.reverse[x])),
//         "editableBy": editableBy == null
//             ? null
//             : List<dynamic>.from(
//                 editableBy!.map((x) => editableByValues.reverse[x])),
//         "columnMetadataId": columnMetadataId ?? columnMetadataId,
//         "udfValue": udfValue,
//         "storage": storage,
//         "url": url,
//         "webcam": webcam,
//         "fileTypes": fileTypes == null
//             ? null
//             : List<dynamic>.from(
//                 fileTypes!.map(
//                   (x) => x.toJson(),
//                 ),
//               ),
//         "hidden": hidden,
//         "disabled": disabled,
//         "validate": validate ?? validate!.toJson(),
//       };
// }

// class PublicGrievanceColumns {
//   PublicGrievanceColumns({
//     this.components,
//     this.width,
//     this.offset,
//     this.push,
//     this.pull,
//     this.size,
//   });

//   List<ColumnComponent>? components;
//   int? width;
//   int? offset;
//   int? push;
//   int? pull;
//   SizeValue? size;

//   factory PublicGrievanceColumns.fromJson(Map<String, dynamic> json) =>
//       PublicGrievanceColumns(
//         components: List<ColumnComponent>.from(
//             json["components"].map((x) => ColumnComponent.fromJson(x))),
//         width: json["width"],
//         offset: json["offset"],
//         push: json["push"],
//         pull: json["pull"],
//         size: sizeValues.map[json["size"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
//         "width": width,
//         "offset": offset,
//         "push": push,
//         "pull": pull,
//         "size": sizeValues.reverse[size],
//       };
// }

// enum EditableBy { REQUESTER, OWNER, ASSIGNEE }

// final editableByValues = EnumValues({
//   "Assignee": EditableBy.ASSIGNEE,
//   "Owner": EditableBy.OWNER,
//   "Requester": EditableBy.REQUESTER
// });

// // enum Type { NUMBER, TEXTFIELD, SELECT }

// // final typeValues = EnumValues({
// //   "number": Type.NUMBER,
// //   "select": Type.SELECT,
// //   "textfield": Type.TEXTFIELD
// // });

// enum ViewableBy { ALL }

// final viewableByValues = EnumValues({"All": ViewableBy.ALL});

// class FluffyValidate {
//   FluffyValidate({
//     this.required,
//     this.maxWords,
//   });

//   bool? required;
//   int? maxWords;

//   factory FluffyValidate.fromJson(Map<String, dynamic> json) => FluffyValidate(
//         required: json["required"],
//         maxWords: json["maxWords"],
//       );

//   Map<String, dynamic> toJson() => {
//         "required": required,
//         "maxWords": maxWords,
//       };
// }
