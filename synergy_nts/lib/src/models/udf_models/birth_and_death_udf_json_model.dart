// ! hardcoding UNDO
// // ignore_for_file: constant_identifier_names

// import 'dart:convert';

// import './udf_json_model.dart';

// BirthDeathUdfJson birthDeathUdfJsonFromJson(String str) =>
//     BirthDeathUdfJson.fromJson(json.decode(str));

// String birthDeathUdfJsonToJson(BirthDeathUdfJson data) =>
//     json.encode(data.toJson());

// class BirthDeathUdfJson {
//   BirthDeathUdfJson({
//     this.synergyTableMapId,
//     this.components,
//   });

//   String? synergyTableMapId;
//   List<BirthDeathUdfJsonComponent>? components;

//   factory BirthDeathUdfJson.fromJson(Map<String, dynamic> json) =>
//       BirthDeathUdfJson(
//         synergyTableMapId: json["synergyTableMapId"],
//         components: List<BirthDeathUdfJsonComponent>.from(json["components"]
//             .map((x) => BirthDeathUdfJsonComponent.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "synergyTableMapId": synergyTableMapId,
//         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
//       };
// }

// class BirthDeathUdfJsonComponent {
//   BirthDeathUdfJsonComponent({
//     this.legend,
//     this.key,
//     this.type,
//     this.label,
//     this.input,
//     this.tableView,
//     this.components,
//   });

//   String? legend;
//   String? key;
//   FluffyType? type;
//   String? label;
//   bool? input;
//   bool? tableView;
//   List<BirthDeathPurpleComponent>? components;

//   factory BirthDeathUdfJsonComponent.fromJson(Map<String, dynamic> json) =>
//       BirthDeathUdfJsonComponent(
//         legend: json["legend"],
//         key: json["key"],
//         type: fluffyTypeValues.map[json["type"]],
//         label: json["label"],
//         input: json["input"],
//         tableView: json["tableView"],
//         components: List<BirthDeathPurpleComponent>.from(json["components"]
//             .map((x) => BirthDeathPurpleComponent.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "legend": legend,
//         "key": key,
//         "type": fluffyTypeValues.reverse[type],
//         "label": label,
//         "input": input,
//         "tableView": tableView,
//         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
//       };
// }

// class BirthDeathPurpleComponent {
//   BirthDeathPurpleComponent({
//     this.label,
//     this.columns,
//     this.key,
//     this.type,
//     this.input,
//     this.tableView,
//     this.tag,
//     this.attrs,
//     this.content,
//     this.refreshOnChange,
//     this.legend,
//     this.components,
//     this.autoExpand,
//     this.ntsType,
//     this.editableContext,
//     this.viewableContext,
//     this.viewableBy,
//     this.editableBy,
//     this.columnMetadataId,
//     this.udfValue,
//     this.hideOnChildrenHidden,
//   });

//   LabelType? label;
//   List<Columns>? columns;
//   String? key;
//   FluffyType? type;
//   bool? input;
//   bool? tableView;
//   String? tag;
//   List<Attr>? attrs;
//   String? content;
//   bool? refreshOnChange;
//   String? legend;
//   List<TentacledComponent>? components;
//   bool? autoExpand;
//   NtsType? ntsType;
//   List<EditableContext>? editableContext;
//   List<EditableContext>? viewableContext;
//   List<AbleBy>? viewableBy;
//   List<AbleBy>? editableBy;
//   String? columnMetadataId;
//   String? udfValue;
//   bool? hideOnChildrenHidden;

//   factory BirthDeathPurpleComponent.fromJson(Map<String, dynamic> json) =>
//       BirthDeathPurpleComponent(
//         label: labelValues.map[json["label"]],
//         columns: json["columns"] == null
//             ? null
//             : List<Columns>.from(
//                 json["columns"].map((x) => Columns.fromJson(x))),
//         key: json["key"],
//         type: fluffyTypeValues.map[json["type"]],
//         input: json["input"],
//         tableView: json["tableView"],
//         tag: json["tag"],
//         attrs: json["attrs"] == null
//             ? null
//             : List<Attr>.from(json["attrs"].map((x) => Attr.fromJson(x))),
//         content: json["content"],
//         refreshOnChange: json["refreshOnChange"],
//         legend: json["legend"],
//         components: json["components"] == null
//             ? null
//             : List<TentacledComponent>.from(
//                 json["components"].map((x) => TentacledComponent.fromJson(x))),
//         autoExpand: json["autoExpand"],
//         ntsType:
//             json["ntsType"] == null ? null : ntsTypeValues.map[json["ntsType"]],
//         // editableContext: json["editableContext"] == null
//         //     ? null
//         //     : List<AbleContext>.from(
//         //         json["editableContext"].map((x) => ableContextValues.map![x])),
//         // viewableContext: json["viewableContext"] == null
//         //     ? null
//         //     : List<AbleContext>.from(
//         //         json["viewableContext"].map((x) => ableContextValues.map![x])),
//         viewableBy: json["viewableBy"] == null
//             ? null
//             : List<AbleBy>.from(
//                 json["viewableBy"].map((x) => ableByValues.map[x])),
//         editableBy: json["editableBy"] == null
//             ? null
//             : List<AbleBy>.from(
//                 json["editableBy"].map((x) => ableByValues.map[x])),
//         columnMetadataId: json["columnMetadataId"],
//         udfValue: json["udfValue"],
//         hideOnChildrenHidden: json["hideOnChildrenHidden"],
//       );

//   Map<String, dynamic> toJson() => {
//         "label": labelValues.reverse[label],
//         "columns": columns == null
//             ? null
//             : List<dynamic>.from(columns!.map((x) => x.toJson())),
//         "key": key,
//         "type": fluffyTypeValues.reverse[type],
//         "input": input,
//         "tableView": tableView,
//         "tag": tag,
//         "attrs": attrs == null
//             ? null
//             : List<dynamic>.from(attrs!.map((x) => x.toJson())),
//         "content": content,
//         "refreshOnChange": refreshOnChange,
//         "legend": legend,
//         "components": components == null
//             ? null
//             : List<dynamic>.from(components!.map((x) => x.toJson())),
//         "autoExpand": autoExpand,
//         "ntsType": ntsType == null ? null : ntsTypeValues.reverse[ntsType],
//         // "editableContext": editableContext == null
//         //     ? null
//         //     : List<dynamic>.from(
//         //         editableContext!.map((x) => ableContextValues.reverse[x])),
//         // "viewableContext": viewableContext == null
//         //     ? null
//         //     : List<dynamic>.from(
//         //         viewableContext!.map((x) => ableContextValues.reverse[x])),
//         "viewableBy": viewableBy == null
//             ? null
//             : List<dynamic>.from(
//                 viewableBy!.map((x) => ableByValues.reverse[x])),
//         "editableBy": editableBy == null
//             ? null
//             : List<dynamic>.from(
//                 editableBy!.map((x) => ableByValues.reverse[x])),
//         "columnMetadataId": columnMetadataId,
//         "udfValue": udfValue,
//         "hideOnChildrenHidden": hideOnChildrenHidden,
//       };
// }

// class Attr {
//   Attr({
//     this.attr,
//     this.value,
//   });

//   String? attr;
//   String? value;

//   factory Attr.fromJson(Map<String, dynamic> json) => Attr(
//         attr: json["attr"],
//         value: json["value"],
//       );

//   Map<String, dynamic> toJson() => {
//         "attr": attr,
//         "value": value,
//       };
// }

// // class PurpleColumn {
// //   PurpleColumn({
// //     this.components,
// //     this.width,
// //     this.offset,
// //     this.push,
// //     this.pull,
// //     this.size,
// //   });

// //   List<ColumnComponent>? components;
// //   int? width;
// //   int? offset;
// //   int? push;
// //   int? pull;
// //   Size? size;

// //   factory PurpleColumn.fromJson(Map<String, dynamic> json) => PurpleColumn(
// //         components: List<ColumnComponent>.from(
// //             json["components"].map((x) => ColumnComponent.fromJson(x))),
// //         width: json["width"],
// //         offset: json["offset"],
// //         push: json["push"],
// //         pull: json["pull"],
// //         size: sizeValues.map![json["size"]],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
// //         "width": width,
// //         "offset": offset,
// //         "push": push,
// //         "pull": pull,
// //         "size": sizeValues.reverse[size],
// //       };
// // }

// // class BirthDeathFluffyComponent {
// //   BirthDeathFluffyComponent({
// //     this.label,
// //     this.tableView,
// //     this.ntsType,
// //     this.editableContext,
// //     this.viewableContext,
// //     this.viewableBy,
// //     this.editableBy,
// //     this.validate,
// //     this.key,
// //     this.type,
// //     this.input,
// //     this.hideOnChildrenHidden,
// //     this.columnMetadataId,
// //     this.udfValue,
// //     this.format,
// //     this.enableMinDateInput,
// //     this.datePicker,
// //     this.enableMaxDateInput,
// //     this.enableTime,
// //     this.widget,
// //     this.loadTable,
// //     this.parameterCode,
// //     this.dataSrc,
// //     this.data,
// //     this.valueProperty,
// //     this.idPath,
// //     this.template,
// //     this.selectThreshold,
// //     this.indexeddb,
// //     this.allTable,
// //     this.isDependantComponent,
// //     this.disableLimit,
// //     this.mask,
// //     this.spellcheck,
// //     this.delimiter,
// //     this.requireDecimal,
// //     this.inputFormat,
// //     this.hidden,
// //     this.disabled,
// //     this.inputMask,
// //     this.optionsLabelPosition,
// //     this.inline,
// //     this.values,
// //     this.onChangeServerLogic,
// //     this.rowDataValue,
// //     this.defaultValue,
// //     this.mapId,
// //     this.mapValue,
// //     this.refreshOn,
// //     this.storage,
// //     this.url,
// //     this.webcam,
// //     this.fileTypes,
// //   });

// //   String? label;
// //   bool? tableView;
// //   NtsType? ntsType;
// //   List<AbleContext>? editableContext;
// //   List<AbleContext>? viewableContext;
// //   List<AbleBy>? viewableBy;
// //   List<AbleBy>? editableBy;
// //   Validate? validate;
// //   String? key;
// //   Type? type;
// //   bool? input;
// //   bool? hideOnChildrenHidden;
// //   String? columnMetadataId;
// //   String? udfValue;
// //   String? format;
// //   bool? enableMinDateInput;
// //   DatePicker? datePicker;
// //   bool? enableMaxDateInput;
// //   bool? enableTime;
// //   String? widget;
// //   LoadTable? loadTable;
// //   String? parameterCode;
// //   DataSrc? dataSrc;
// //   Data? data;
// //   IdPath? valueProperty;
// //   IdPath? idPath;
// //   Template? template;
// //   double? selectThreshold;
// //   Indexeddb? indexeddb;
// //   String? allTable;
// //   bool? isDependantComponent;
// //   bool? disableLimit;
// //   bool? mask;
// //   bool? spellcheck;
// //   bool? delimiter;
// //   bool? requireDecimal;
// //   String? inputFormat;
// //   bool? hidden;
// //   bool? disabled;
// //   String? inputMask;
// //   String? optionsLabelPosition;
// //   bool? inline;
// //   List<PurpleValue>? values;
// //   String? onChangeServerLogic;
// //   String? rowDataValue;
// //   bool? defaultValue;
// //   IdPath? mapId;
// //   MapValue? mapValue;
// //   String? refreshOn;
// //   DataSrc? storage;
// //   String? url;
// //   bool? webcam;
// //   List<FileType>? fileTypes;

// //   factory BirthDeathFluffyComponent.fromJson(Map<String, dynamic> json) =>
// //       BirthDeathFluffyComponent(
// //         label: json["label"],
// //         tableView: json["tableView"],
// //         ntsType: json["ntsType"] == null
// //             ? null
// //             : ntsTypeValues.map![json["ntsType"]],
// //         editableContext: json["editableContext"] == null
// //             ? null
// //             : List<AbleContext>.from(
// //                 json["editableContext"].map((x) => ableContextValues.map![x])),
// //         viewableContext: json["viewableContext"] == null
// //             ? null
// //             : List<AbleContext>.from(
// //                 json["viewableContext"].map((x) => ableContextValues.map![x])),
// //         viewableBy: json["viewableBy"] == null
// //             ? null
// //             : List<AbleBy>.from(
// //                 json["viewableBy"].map((x) => ableByValues.map![x])),
// //         editableBy: json["editableBy"] == null
// //             ? null
// //             : List<AbleBy>.from(
// //                 json["editableBy"].map((x) => ableByValues.map![x])),
// //         validate: json["validate"] == null
// //             ? null
// //             : Validate.fromJson(json["validate"]),
// //         key: json["key"],
// //         type: typeValues.map![json["type"]],
// //         input: json["input"],
// //         hideOnChildrenHidden: json["hideOnChildrenHidden"],
// //         columnMetadataId: json["columnMetadataId"],
// //         udfValue: json["udfValue"],
// //         format: json["format"] == null ? null : json["format"],
// //         enableMinDateInput: json["enableMinDateInput"] == null
// //             ? null
// //             : json["enableMinDateInput"],
// //         datePicker: json["datePicker"] == null
// //             ? null
// //             : DatePicker.fromJson(json["datePicker"]),
// //         enableMaxDateInput: json["enableMaxDateInput"] == null
// //             ? null
// //             : json["enableMaxDateInput"],
// //         enableTime: json["enableTime"] == null ? null : json["enableTime"],
// //         widget: json["widget"],
// //         loadTable: json["loadTable"] == null
// //             ? null
// //             : loadTableValues.map![json["loadTable"]],
// //         parameterCode:
// //             json["parameterCode"] == null ? null : json["parameterCode"],
// //         dataSrc: json["dataSrc"] == null
// //             ? null
// //             : dataSrcValues.map![json["dataSrc"]],
// //         data: json["data"] == null ? null : Data.fromJson(json["data"]),
// //         valueProperty: json["valueProperty"] == null
// //             ? null
// //             : idPathValues.map![json["valueProperty"]],
// //         idPath:
// //             json["idPath"] == null ? null : idPathValues.map![json["idPath"]],
// //         template: json["template"] == null
// //             ? null
// //             : templateValues.map![json["template"]],
// //         selectThreshold: json["selectThreshold"] == null
// //             ? null
// //             : json["selectThreshold"].toDouble(),
// //         indexeddb: json["indexeddb"] == null
// //             ? null
// //             : Indexeddb.fromJson(json["indexeddb"]),
// //         allTable: json["allTable"] == null ? null : json["allTable"],
// //         isDependantComponent: json["isDependantComponent"] == null
// //             ? null
// //             : json["isDependantComponent"],
// //         disableLimit:
// //             json["disableLimit"] == null ? null : json["disableLimit"],
// //         mask: json["mask"] == null ? null : json["mask"],
// //         spellcheck: json["spellcheck"] == null ? null : json["spellcheck"],
// //         delimiter: json["delimiter"] == null ? null : json["delimiter"],
// //         requireDecimal:
// //             json["requireDecimal"] == null ? null : json["requireDecimal"],
// //         inputFormat: json["inputFormat"] == null ? null : json["inputFormat"],
// //         hidden: json["hidden"] == null ? null : json["hidden"],
// //         disabled: json["disabled"] == null ? null : json["disabled"],
// //         inputMask: json["inputMask"] == null ? null : json["inputMask"],
// //         optionsLabelPosition: json["optionsLabelPosition"] == null
// //             ? null
// //             : json["optionsLabelPosition"],
// //         inline: json["inline"] == null ? null : json["inline"],
// //         values: json["values"] == null
// //             ? null
// //             : List<PurpleValue>.from(
// //                 json["values"].map((x) => PurpleValue.fromJson(x))),
// //         onChangeServerLogic: json["onChangeServerLogic"] == null
// //             ? null
// //             : json["onChangeServerLogic"],
// //         rowDataValue:
// //             json["rowDataValue"] == null ? null : json["rowDataValue"],
// //         defaultValue:
// //             json["defaultValue"] == null ? null : json["defaultValue"],
// //         mapId: json["mapId"] == null ? null : idPathValues.map![json["mapId"]],
// //         mapValue: json["mapValue"] == null
// //             ? null
// //             : mapValueValues.map![json["mapValue"]],
// //         refreshOn: json["refreshOn"] == null ? null : json["refreshOn"],
// //         storage: json["storage"] == null
// //             ? null
// //             : dataSrcValues.map![json["storage"]],
// //         url: json["url"] == null ? null : json["url"],
// //         webcam: json["webcam"] == null ? null : json["webcam"],
// //         fileTypes: json["fileTypes"] == null
// //             ? null
// //             : List<FileType>.from(
// //                 json["fileTypes"].map((x) => FileType.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "label": label,
// //         "tableView": tableView,
// //         "ntsType": ntsType == null ? null : ntsTypeValues.reverse[ntsType],
// //         "editableContext": editableContext == null
// //             ? null
// //             : List<dynamic>.from(
// //                 editableContext!.map((x) => ableContextValues.reverse[x])),
// //         "viewableContext": viewableContext == null
// //             ? null
// //             : List<dynamic>.from(
// //                 viewableContext!.map((x) => ableContextValues.reverse[x])),
// //         "viewableBy": viewableBy == null
// //             ? null
// //             : List<dynamic>.from(
// //                 viewableBy!.map((x) => ableByValues.reverse[x])),
// //         "editableBy": editableBy == null
// //             ? null
// //             : List<dynamic>.from(
// //                 editableBy!.map((x) => ableByValues.reverse[x])),
// //         "validate": validate == null ? null : validate!.toJson(),
// //         "key": key,
// //         "type": typeValues.reverse[type],
// //         "input": input,
// //         "hideOnChildrenHidden": hideOnChildrenHidden,
// //         "columnMetadataId": columnMetadataId,
// //         "udfValue": udfValue,
// //         "format": format == null ? null : format,
// //         "enableMinDateInput":
// //             enableMinDateInput == null ? null : enableMinDateInput,
// //         "datePicker": datePicker == null ? null : datePicker!.toJson(),
// //         "enableMaxDateInput":
// //             enableMaxDateInput == null ? null : enableMaxDateInput,
// //         "enableTime": enableTime == null ? null : enableTime,
// //         "widget": widget,
// //         "loadTable":
// //             loadTable == null ? null : loadTableValues.reverse[loadTable],
// //         "parameterCode": parameterCode == null ? null : parameterCode,
// //         "dataSrc": dataSrc == null ? null : dataSrcValues.reverse[dataSrc],
// //         "data": data == null ? null : data!.toJson(),
// //         "valueProperty":
// //             valueProperty == null ? null : idPathValues.reverse[valueProperty],
// //         "idPath": idPath == null ? null : idPathValues.reverse[idPath],
// //         "template": template == null ? null : templateValues.reverse[template],
// //         "selectThreshold": selectThreshold == null ? null : selectThreshold,
// //         "indexeddb": indexeddb == null ? null : indexeddb!.toJson(),
// //         "allTable": allTable == null ? null : allTable,
// //         "isDependantComponent":
// //             isDependantComponent == null ? null : isDependantComponent,
// //         "disableLimit": disableLimit == null ? null : disableLimit,
// //         "mask": mask == null ? null : mask,
// //         "spellcheck": spellcheck == null ? null : spellcheck,
// //         "delimiter": delimiter == null ? null : delimiter,
// //         "requireDecimal": requireDecimal == null ? null : requireDecimal,
// //         "inputFormat": inputFormat == null ? null : inputFormat,
// //         "hidden": hidden == null ? null : hidden,
// //         "disabled": disabled == null ? null : disabled,
// //         "inputMask": inputMask == null ? null : inputMask,
// //         "optionsLabelPosition":
// //             optionsLabelPosition == null ? null : optionsLabelPosition,
// //         "inline": inline == null ? null : inline,
// //         "values": values == null
// //             ? null
// //             : List<dynamic>.from(values!.map((x) => x.toJson())),
// //         "onChangeServerLogic":
// //             onChangeServerLogic == null ? null : onChangeServerLogic,
// //         "rowDataValue": rowDataValue == null ? null : rowDataValue,
// //         "defaultValue": defaultValue == null ? null : defaultValue,
// //         "mapId": mapId == null ? null : idPathValues.reverse[mapId],
// //         "mapValue": mapValue == null ? null : mapValueValues.reverse[mapValue],
// //         "refreshOn": refreshOn == null ? null : refreshOn,
// //         "storage": storage == null ? null : dataSrcValues.reverse[storage],
// //         "url": url == null ? null : url,
// //         "webcam": webcam == null ? null : webcam,
// //         "fileTypes": fileTypes == null
// //             ? null
// //             : List<dynamic>.from(fileTypes!.map((x) => x.toJson())),
// //       };
// // }

// // class Data {
// //   Data({
// //     this.values,
// //     this.url,
// //     this.headers,
// //   });

// //   List<FileType>? values;
// //   String? url;
// //   List<Header>? headers;

// //   factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         values: json["values"] == null
// //             ? null
// //             : List<FileType>.from(
// //                 json["values"].map((x) => FileType.fromJson(x))),
// //         url: json["url"],
// //         headers:
// //             List<Header>.from(json["headers"].map((x) => Header.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "values": values == null
// //             ? null
// //             : List<dynamic>.from(values!.map((x) => x.toJson())),
// //         "url": url,
// //         "headers": List<dynamic>.from(headers!.map((x) => x.toJson())),
// //       };
// // }

// // class Header {
// //   Header({
// //     this.key,
// //     this.value,
// //   });

// //   String? key;
// //   String? value;

// //   factory Header.fromJson(Map<String, dynamic> json) => Header(
// //         key: json["key"],
// //         value: json["value"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "key": key,
// //         "value": value,
// //       };
// // }

// // class FileType {
// //   FileType({
// //     this.label,
// //     this.value,
// //   });

// //   String? label;
// //   String? value;

// //   factory FileType.fromJson(Map<String, dynamic> json) => FileType(
// //         label: json["label"],
// //         value: json["value"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "label": label,
// //         "value": value,
// //       };
// // }

// // enum DataSrc { URL }

// // final dataSrcValues = EnumValues({"url": DataSrc.URL});

// // class DatePicker {
// //   DatePicker({
// //     this.disableWeekends,
// //     this.disableWeekdays,
// //   });

// //   bool? disableWeekends;
// //   bool? disableWeekdays;

// //   factory DatePicker.fromJson(Map<String, dynamic> json) => DatePicker(
// //         disableWeekends: json["disableWeekends"],
// //         disableWeekdays: json["disableWeekdays"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "disableWeekends": disableWeekends,
// //         "disableWeekdays": disableWeekdays,
// //       };
// // }

// // enum AbleBy { REQUESTER, OWNER, SHARED_WITH, ALL, ASSIGNEE }

// // final ableByValues = EnumValues({
// //   "All": AbleBy.ALL,
// //   "Assignee": AbleBy.ASSIGNEE,
// //   "Owner": AbleBy.OWNER,
// //   "Requester": AbleBy.REQUESTER,
// //   "SharedWith": AbleBy.SHARED_WITH,
// // });

// // enum AbleContext {
// //   SERVICE_STATUS_DRAFT,
// //   SERVICE_STATUS_INPROGRESS,
// //   SERVICE_STATUS_OVERDUE,
// //   SERVICE_STATUS_ALL
// // }

// // final ableContextValues = EnumValues({
// //   "SERVICE_STATUS_ALL": AbleContext.SERVICE_STATUS_ALL,
// //   "SERVICE_STATUS_DRAFT": AbleContext.SERVICE_STATUS_DRAFT,
// //   "SERVICE_STATUS_INPROGRESS": AbleContext.SERVICE_STATUS_INPROGRESS,
// //   "SERVICE_STATUS_OVERDUE": AbleContext.SERVICE_STATUS_OVERDUE
// // });

// // enum IdPath { ID, NAME, UDF_NOTE_TABLE_ID }

// // final idPathValues = EnumValues({
// //   "Id": IdPath.ID,
// //   "Name": IdPath.NAME,
// //   "UdfNoteTableId": IdPath.UDF_NOTE_TABLE_ID
// // });

// // class Indexeddb {
// //   Indexeddb({
// //     this.filter,
// //   });

// //   Filter? filter;

// //   factory Indexeddb.fromJson(Map<String, dynamic> json) => Indexeddb(
// //         filter: Filter.fromJson(json["filter"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "filter": filter!.toJson(),
// //       };
// // }

// // class Filter {
// //   Filter();

// //   factory Filter.fromJson(Map<String, dynamic> json) => Filter();

// //   Map<String, dynamic> toJson() => {};
// // }

// // enum LoadTable { LOV, TABLE }

// // final loadTableValues =
// //     EnumValues({"LOV": LoadTable.LOV, "TABLE": LoadTable.TABLE});

// // enum MapValue { NAME }

// // final mapValueValues = EnumValues({"Name": MapValue.NAME});

// // enum NtsType { LOV_SERVICE_STATUS }

// // final ntsTypeValues =
// //     EnumValues({"LOV_SERVICE_STATUS": NtsType.LOV_SERVICE_STATUS});

// // enum Template { SPAN_ITEM_NAME_SPAN }

// // final templateValues =
// //     EnumValues({"<span>{{ item.Name }}</span>": Template.SPAN_ITEM_NAME_SPAN});

// // enum Type {
// //   TEXTFIELD,
// //   DATETIME,
// //   SELECT,
// //   NUMBER,
// //   TIME,
// //   RADIO,
// //   EMAIL,
// //   CHECKBOX,
// //   FILE
// // }

// // final typeValues = EnumValues({
// //   "checkbox": Type.CHECKBOX,
// //   "datetime": Type.DATETIME,
// //   "email": Type.EMAIL,
// //   "file": Type.FILE,
// //   "number": Type.NUMBER,
// //   "radio": Type.RADIO,
// //   "select": Type.SELECT,
// //   "textfield": Type.TEXTFIELD,
// //   "time": Type.TIME
// // });

// // class Validate {
// //   Validate({
// //     this.required,
// //     this.onlyAvailableItems,
// //   });

// //   bool? required;
// //   bool? onlyAvailableItems;

// //   factory Validate.fromJson(Map<String, dynamic> json) => Validate(
// //         required: json["required"] == null ? null : json["required"],
// //         onlyAvailableItems: json["onlyAvailableItems"] == null
// //             ? null
// //             : json["onlyAvailableItems"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "required": required == null ? null : required,
// //         "onlyAvailableItems":
// //             onlyAvailableItems == null ? null : onlyAvailableItems,
// //       };
// // }

// // class PurpleValue {
// //   PurpleValue({
// //     this.label,
// //     this.value,
// //     this.shortcut,
// //   });

// //   String? label;
// //   String? value;
// //   String? shortcut;

// //   factory PurpleValue.fromJson(Map<String, dynamic> json) => PurpleValue(
// //         label: json["label"],
// //         value: json["value"],
// //         shortcut: json["shortcut"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "label": label,
// //         "value": value,
// //         "shortcut": shortcut,
// //       };
// // }

// enum WidgetEnum { CHOICESJS }

// final widgetEnumValues = EnumValues({"choicesjs": WidgetEnum.CHOICESJS});

// // enum Size { MD }

// // final sizeValues = EnumValues({"md": Size.MD});

// class TentacledComponent {
//   TentacledComponent({
//     this.label,
//     this.columns,
//     this.key,
//     this.type,
//     this.input,
//     this.tableView,
//     this.components,
//     this.defaultValue,
//     this.editableBy,
//     this.editableContext,
//     this.ntsType,
//     this.onChangeServerLogic,
//     this.udfValue,
//     this.viewableBy,
//     this.viewableContext,
//     this.columnMetadataId,
//   });

//   String? label;
//   List<Columns>? columns;
//   String? key;
//   String? type;
//   bool? input;
//   bool? tableView;
//   List<TentacledComponent>? components;
//   String? onChangeServerLogic;
//   bool? defaultValue;
//   NtsType? ntsType;
//   List<EditableContext>? editableContext;
//   List<EditableContext>? viewableContext;
//   List<AbleBy>? viewableBy;
//   List<AbleBy>? editableBy;
//   String? columnMetadataId;
//   String? udfValue;

//   factory TentacledComponent.fromJson(Map<String, dynamic> json) =>
//       TentacledComponent(
//         label: json["label"],
//         key: json["key"],
//         type: json["type"],
//         input: json["input"],
//         tableView: json["tableView"],
//         components: json["components"] == null
//             ? null
//             : List<TentacledComponent>.from(
//                 json["components"].map((x) => TentacledComponent.fromJson(x))),
//         columns: json["columns"] == null
//             ? null
//             : List<Columns>.from(
//                 json["columns"].map((x) => Columns.fromJson(x))),
//         onChangeServerLogic: json["onChangeServerLogic"],
//         defaultValue: json["defaultValue"],
//         ntsType:
//             json["ntsType"] == null ? null : ntsTypeValues.map[json["ntsType"]],
//         // editableContext: json["editableContext"] == null
//         //     ? null
//         //     : List<EditableContext>.from(
//         //         json["editableContext"].map((x) => ableContextValues.map![x])),
//         // viewableContext: json["viewableContext"] == null
//         //     ? null
//         //     : List<EditableContext>.from(
//         //         json["viewableContext"].map((x) => ableContextValues.map![x])),
//         viewableBy: json["viewableBy"] == null
//             ? null
//             : List<AbleBy>.from(
//                 json["viewableBy"].map((x) => ableByValues.map[x])),
//         editableBy: json["editableBy"] == null
//             ? null
//             : List<AbleBy>.from(
//                 json["editableBy"].map((x) => ableByValues.map[x])),
//         columnMetadataId: json["columnMetadataId"],
//         udfValue: json["udfValue"],
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
//         "columns": columns == null
//             ? null
//             : List<dynamic>.from(columns!.map((x) => x.toJson())),
//         "onChangeServerLogic": onChangeServerLogic,
//         "defaultValue": defaultValue,
//         "ntsType": ntsType == null ? null : ntsTypeValues.reverse[ntsType],
//         // "editableContext": editableContext == null
//         //     ? null
//         //     : List<dynamic>.from(
//         //         editableContext!.map((x) => ableContextValues.reverse[x])),
//         // "viewableContext": viewableContext == null
//         //     ? null
//         //     : List<dynamic>.from(
//         //         viewableContext!.map((x) => ableContextValues.reverse[x])),
//         "viewableBy": viewableBy == null
//             ? null
//             : List<dynamic>.from(
//                 viewableBy!.map((x) => ableByValues.reverse[x])),
//         "editableBy": editableBy == null
//             ? null
//             : List<dynamic>.from(
//                 editableBy!.map((x) => ableByValues.reverse[x])),
//         "columnMetadataId": columnMetadataId,
//         "udfValue": udfValue,
//       };
// }

// // class FluffyColumn {
// //   FluffyColumn({
// //     this.components,
// //     this.width,
// //     this.offset,
// //     this.push,
// //     this.pull,
// //     this.size,
// //   });

// //   List<ColumnComponent>? components;
// //   int? width;
// //   int? offset;
// //   int? push;
// //   int? pull;
// //   Size? size;

// //   factory FluffyColumn.fromJson(Map<String, dynamic> json) => FluffyColumn(
// //         components: List<ColumnComponent>.from(
// //             json["components"].map((x) => ColumnComponent.fromJson(x))),
// //         width: json["width"],
// //         offset: json["offset"],
// //         push: json["push"],
// //         pull: json["pull"],
// //         size: sizeValues.map![json["size"]],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "components": List<dynamic>.from(components!.map((x) => x.toJson())),
// //         "width": width,
// //         "offset": offset,
// //         "push": push,
// //         "pull": pull,
// //         "size": sizeValues.reverse[size],
// //       };
// // }

// // class StickyComponent {
// //   StickyComponent({
// //     this.label,
// //     this.tableView,
// //     this.ntsType,
// //     this.editableContext,
// //     this.viewableContext,
// //     this.viewableBy,
// //     this.editableBy,
// //     this.validate,
// //     this.key,
// //     this.type,
// //     this.input,
// //     this.hideOnChildrenHidden,
// //     this.columnMetadataId,
// //     this.udfValue,
// //     this.loadTable,
// //     this.dataSrc,
// //     this.data,
// //     this.valueProperty,
// //     this.idPath,
// //     this.template,
// //     this.selectThreshold,
// //     this.indexeddb,
// //     this.allTable,
// //     this.isDependantComponent,
// //     this.mapId,
// //     this.mapValue,
// //     this.disableLimit,
// //     this.widget,
// //     this.refreshOn,
// //     this.mask,
// //     this.spellcheck,
// //     this.delimiter,
// //     this.requireDecimal,
// //     this.inputFormat,
// //     this.optionsLabelPosition,
// //     this.inline,
// //     this.values,
// //     this.storage,
// //     this.url,
// //     this.webcam,
// //     this.fileTypes,
// //     this.parameterCode,
// //     this.rowDataValue,
// //   });

// //   String? label;
// //   bool? tableView;
// //   NtsType? ntsType;
// //   List<EditableContext>? editableContext;
// //   List<EditableContext>? viewableContext;
// //   List<AbleBy>? viewableBy;
// //   List<AbleBy>? editableBy;
// //   Validate? validate;
// //   String? key;
// //   Type? type;
// //   bool? input;
// //   bool? hideOnChildrenHidden;
// //   String? columnMetadataId;
// //   String? udfValue;
// //   LoadTable? loadTable;
// //   DataSrc? dataSrc;
// //   Data? data;
// //   IdPath? valueProperty;
// //   IdPath? idPath;
// //   Template? template;
// //   double? selectThreshold;
// //   Indexeddb? indexeddb;
// //   String? allTable;
// //   bool? isDependantComponent;
// //   IdPath? mapId;
// //   MapValue? mapValue;
// //   bool? disableLimit;
// //   WidgetEnum? widget;
// //   String? refreshOn;
// //   bool? mask;
// //   bool? spellcheck;
// //   bool? delimiter;
// //   bool? requireDecimal;
// //   String? inputFormat;
// //   String? optionsLabelPosition;
// //   bool? inline;
// //   List<Value>? values;
// //   DataSrc? storage;
// //   String? url;
// //   bool? webcam;
// //   List<FileType>? fileTypes;
// //   String? rowDataValue;
// //   String? parameterCode;

// //   factory StickyComponent.fromJson(Map<String, dynamic> json) =>
// //       StickyComponent(
// //         label: json["label"],
// //         tableView: json["tableView"],
// //         ntsType: (json["ntsType"] == null)
// //             ? null
// //             : ntsTypeValues.map![json["ntsType"]],
// //         // editableContext: (json["editableContext"] == null)
// //         //     ? null
// //         //     : List<AbleContext>.from(
// //         //         json["editableContext"].map((x) => ableContextValues.map![x])),
// //         // viewableContext: (json["viewableContext"] == null)
// //         //     ? null
// //         //     : List<AbleContext>.from(
// //         //         json["viewableContext"].map((x) => ableContextValues.map![x])),
// //         viewableBy: (json["viewableBy"] == null)
// //             ? null
// //             : List<AbleBy>.from(
// //                 json["viewableBy"].map((x) => ableByValues.map![x])),
// //         editableBy: (json["editableBy"] == null)
// //             ? null
// //             : List<AbleBy>.from(
// //                 json["editableBy"].map((x) => ableByValues.map![x])),
// //         validate: Validate.fromJson(json["validate"]),
// //         key: json["key"],
// //         type: typeValues.map![json["type"]],
// //         input: json["input"],
// //         hideOnChildrenHidden: json["hideOnChildrenHidden"],
// //         columnMetadataId: json["columnMetadataId"],
// //         udfValue: json["udfValue"],
// //         loadTable: json["loadTable"] == null
// //             ? null
// //             : loadTableValues.map![json["loadTable"]],
// //         dataSrc: json["dataSrc"] == null
// //             ? null
// //             : dataSrcValues.map![json["dataSrc"]],
// //         data: json["data"] == null ? null : Data.fromJson(json["data"]),
// //         valueProperty: json["valueProperty"] == null
// //             ? null
// //             : idPathValues.map![json["valueProperty"]],
// //         idPath:
// //             json["idPath"] == null ? null : idPathValues.map![json["idPath"]],
// //         template: json["template"] == null
// //             ? null
// //             : templateValues.map![json["template"]],
// //         selectThreshold: json["selectThreshold"] == null
// //             ? null
// //             : json["selectThreshold"].toDouble(),
// //         indexeddb: json["indexeddb"] == null
// //             ? null
// //             : Indexeddb.fromJson(json["indexeddb"]),
// //         allTable: json["allTable"] == null ? null : json["allTable"],
// //         isDependantComponent: json["isDependantComponent"] == null
// //             ? null
// //             : json["isDependantComponent"],
// //         mapId: json["mapId"] == null ? null : idPathValues.map![json["mapId"]],
// //         mapValue: json["mapValue"] == null
// //             ? null
// //             : mapValueValues.map![json["mapValue"]],
// //         disableLimit:
// //             json["disableLimit"] == null ? null : json["disableLimit"],
// //         widget: json["widget"] == null
// //             ? null
// //             : widgetEnumValues.map![json["widget"]],
// //         refreshOn: json["refreshOn"] == null ? null : json["refreshOn"],
// //         mask: json["mask"] == null ? null : json["mask"],
// //         spellcheck: json["spellcheck"] == null ? null : json["spellcheck"],
// //         delimiter: json["delimiter"] == null ? null : json["delimiter"],
// //         requireDecimal:
// //             json["requireDecimal"] == null ? null : json["requireDecimal"],
// //         inputFormat: json["inputFormat"] == null ? null : json["inputFormat"],
// //         optionsLabelPosition: json["optionsLabelPosition"] == null
// //             ? null
// //             : json["optionsLabelPosition"],
// //         inline: json["inline"] == null ? null : json["inline"],
// //         values: json["values"] == null
// //             ? null
// //             : List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
// //         storage: json["storage"] == null
// //             ? null
// //             : dataSrcValues.map![json["storage"]],
// //         url: json["url"] == null ? null : json["url"],
// //         webcam: json["webcam"] == null ? null : json["webcam"],
// //         fileTypes: json["fileTypes"] == null
// //             ? null
// //             : List<FileType>.from(
// //                 json["fileTypes"].map((x) => FileType.fromJson(x))),
// //         rowDataValue:
// //             json["rowDataValue"] == null ? null : json["rowDataValue"],
// //         parameterCode:
// //             json["parameterCode"] == null ? null : json["parameterCode"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "label": label,
// //         "tableView": tableView,
// //         "ntsType": ntsTypeValues.reverse[ntsType],
// //         // "editableContext": List<dynamic>.from(
// //         //     editableContext!.map((x) => ableContextValues.reverse[x])),
// //         // "viewableContext": List<dynamic>.from(
// //         //     viewableContext!.map((x) => ableContextValues.reverse[x])),
// //         "viewableBy":
// //             List<dynamic>.from(viewableBy!.map((x) => ableByValues.reverse[x])),
// //         "editableBy":
// //             List<dynamic>.from(editableBy!.map((x) => ableByValues.reverse[x])),
// //         "validate": validate!.toJson(),
// //         "key": key,
// //         "type": typeValues.reverse[type],
// //         "input": input,
// //         "hideOnChildrenHidden": hideOnChildrenHidden,
// //         "columnMetadataId": columnMetadataId,
// //         "udfValue": udfValue,
// //         "loadTable":
// //             loadTable == null ? null : loadTableValues.reverse[loadTable],
// //         "dataSrc": dataSrc == null ? null : dataSrcValues.reverse[dataSrc],
// //         "data": data == null ? null : data!.toJson(),
// //         "valueProperty":
// //             valueProperty == null ? null : idPathValues.reverse[valueProperty],
// //         "idPath": idPath == null ? null : idPathValues.reverse[idPath],
// //         "template": template == null ? null : templateValues.reverse[template],
// //         "selectThreshold": selectThreshold == null ? null : selectThreshold,
// //         "indexeddb": indexeddb == null ? null : indexeddb!.toJson(),
// //         "allTable": allTable == null ? null : allTable,
// //         "isDependantComponent":
// //             isDependantComponent == null ? null : isDependantComponent,
// //         "mapId": mapId == null ? null : idPathValues.reverse[mapId],
// //         "mapValue": mapValue == null ? null : mapValueValues.reverse[mapValue],
// //         "disableLimit": disableLimit == null ? null : disableLimit,
// //         "widget": widget == null ? null : widgetEnumValues.reverse[widget],
// //         "refreshOn": refreshOn == null ? null : refreshOn,
// //         "mask": mask == null ? null : mask,
// //         "spellcheck": spellcheck == null ? null : spellcheck,
// //         "delimiter": delimiter == null ? null : delimiter,
// //         "requireDecimal": requireDecimal == null ? null : requireDecimal,
// //         "inputFormat": inputFormat == null ? null : inputFormat,
// //         "optionsLabelPosition":
// //             optionsLabelPosition == null ? null : optionsLabelPosition,
// //         "inline": inline == null ? null : inline,
// //         "values": values == null
// //             ? null
// //             : List<dynamic>.from(values!.map((x) => x.toJson())),
// //         "storage": storage == null ? null : dataSrcValues.reverse[storage],
// //         "url": url == null ? null : url,
// //         "webcam": webcam == null ? null : webcam,
// //         "fileTypes": fileTypes == null
// //             ? null
// //             : List<dynamic>.from(fileTypes!.map((x) => x.toJson())),
// //         "disableLimit": disableLimit == null ? null : disableLimit,
// //         "parameterCode": parameterCode == null ? null : parameterCode,
// //       };
// // }

// enum FluffyType { FIELDSET, COLUMNS, CHECKBOX, TEXTAREA }

// final fluffyTypeValues = EnumValues({
//   "checkbox": FluffyType.CHECKBOX,
//   "columns": FluffyType.COLUMNS,
//   "fieldset": FluffyType.FIELDSET,
//   "textarea": FluffyType.TEXTAREA
// });

// // enum LabelType { COLUMNS, EMPTY, USER_REMARK }

// // final labelValues = EnumValues({
// //   "Columns": LabelType.COLUMNS,
// //   "": LabelType.EMPTY,
// //   "User Remark": LabelType.USER_REMARK
// // });

// // class EnumValues<T> {
// //   Map<String, T>? map;
// //   Map<T, String>? reverseMap;

// //   EnumValues(this.map);

// //   Map<T, String> get reverse {
// //     reverseMap ??= map?.map((k, v) => MapEntry(v, k));
// //     return reverseMap!;
// //   }
// // }
