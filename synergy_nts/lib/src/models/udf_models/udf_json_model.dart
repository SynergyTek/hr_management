// ignore_for_file: prefer_if_null_operators, constant_identifier_names

import 'dart:convert';

UdfJson udfJsonComponentFromJson(String str) =>
    UdfJson.fromJson(json.decode(str));

String udfJsonComponentToJson(UdfJson data) => json.encode(data.toJson());

class UdfJson {
  UdfJson({
    this.synergyTableMapId,
    this.components,
    this.columnComponents,
  });

  String? synergyTableMapId;
  List<UdfJsonComponent>? components;
  List<ColumnComponent>? columnComponents;

  factory UdfJson.fromJson(Map<String, dynamic> json) => UdfJson(
        synergyTableMapId: json["synergyTableMapId"],

        components: List<UdfJsonComponent>.from(
          json["components"].map((eachComponent) {
            // Anonymous function that will be used to do some stuff.

            // Hopefully each component is a map and
            // we can access the key's length to determine whether it is a Column component or a UDFJson component.
            if (eachComponent is Map<String, dynamic> &&
                eachComponent.keys.isNotEmpty) {
              // If the length of the keys are greater than 9 (i.e. the number of properties in the UDFJsonComponent), then,
              // we can definitely label it as a ColumnComponent and then parse it accordingly.
              if (eachComponent.keys.length > 9) {
                return UdfJsonComponent(
                  columnComponents: [ColumnComponent.fromJson(eachComponent)],
                );
              } else {
                // Default we are trying to parse it as UDFJsonComponent.

                return UdfJsonComponent.fromJson(eachComponent);
              }
            }
          }),
        ),
      );

  Map<String, dynamic> toJson() => {
        "synergyTableMapId": synergyTableMapId,
        "components": List<dynamic>.from(components!.map((x) => x.toJson())),
        // "components": List<dynamic>.from(columnComponents!.map((x) => x.toJson())),
      };
}

class UdfJsonComponent {
  UdfJsonComponent({
    this.legend,
    this.title,
    this.key,
    this.type,
    this.label,
    this.input,
    this.tableView,
    this.hidden,
    this.components,
    this.columnComponents,
    this.conditional,
  });

  String? legend;
  String? title;
  String? key;
  Type? type;
  String? label;
  bool? input;
  bool? tableView;
  bool? hidden;
  List<PurpleComponent>? components;
  List<ColumnComponent>? columnComponents;
  Conditional? conditional;

  factory UdfJsonComponent.fromJson(Map<String, dynamic> json) =>
      UdfJsonComponent(
        legend: json["legend"],
        title: json["title"],
        key: json["key"],
        type: typeValues.map[json["type"]],
        label: json["label"],
        input: json["input"],
        tableView: json["tableView"],
        hidden: json["hidden"] == null ? null : json["hidden"],
        conditional: json["conditional"] == null
            ? null
            : Conditional.fromJson(json["conditional"]),
        // components: List<PurpleComponent>.from(
        //     json["components"].map((x) => PurpleComponent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "legend": legend,
        "key": key,
        "type": typeValues.reverse[type],
        "label": label,
        "input": input,
        "tableView": tableView,
        "components": List<dynamic>.from(components!.map((x) => x.toJson())),
      };
}

class PurpleComponent {
  PurpleComponent({
    this.label,
    this.columns,
    this.key,
    this.type,
    this.input,
    this.tableView,
    this.components,
    // this.columnComponent,
  });

  LabelType? label;
  List<Columns>? columns;
  String? key;
  Type? type;
  bool? input;
  bool? tableView;
  List<FluffyComponent>? components;
  // List<ColumnComponent>? columnComponent;

  factory PurpleComponent.fromJson(Map<String, dynamic> json) =>
      PurpleComponent(
        label: labelValues.map[json["label"]],
        columns: json["columns"] == null
            ? null
            : List<Columns>.from(
                json["columns"].map((x) => Columns.fromJson(x))),
        key: json["key"],
        type: typeValues.map[json["type"]],
        input: json["input"],
        tableView: json["tableView"],
        components: json["components"] == null
            ? null
            : List<FluffyComponent>.from(
                json["components"].map((x) => FluffyComponent.fromJson(x))),
        // columnComponent: List<ColumnComponent>.from(
        //     json["components"].map((x) => ColumnComponent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": labelValues.reverse[label],
        "columns": columns == null
            ? null
            : List<dynamic>.from(columns!.map((x) => x.toJson())),
        "key": key,
        "type": typeValues.reverse[type],
        "input": input,
        "tableView": tableView,
        "components": components == null
            ? null
            : List<dynamic>.from(components!.map((x) => x.toJson())),
      };
}

class Columns {
  Columns({
    this.components,
    this.width,
    this.offset,
    this.push,
    this.pull,
    this.size,
  });

  List<ColumnComponent>? components;
  int? width;
  int? offset;
  int? push;
  int? pull;
  SizeValue? size;

  factory Columns.fromJson(Map<String, dynamic> json) => Columns(
        components: List<ColumnComponent>.from(
            json["components"].map((x) => ColumnComponent.fromJson(x))),
        width: json["width"],
        offset: json["offset"],
        push: json["push"],
        pull: json["pull"],
        size: sizeValues.map[json["size"]],
      );

  Map<String, dynamic> toJson() => {
        "components": List<dynamic>.from(components!.map((x) => x.toJson())),
        "width": width,
        "offset": offset,
        "push": push,
        "pull": pull,
        "size": sizeValues.reverse[size],
      };
}

class ColumnComponent {
  ColumnComponent({
    this.label,
    this.chartItemName,
    this.tableView,
    this.ntsType,
    this.editableContext,
    this.viewableContext,
    // this.viewableBy,
    this.editableBy,
    this.validate,
    this.key,
    this.type,
    this.input,
    this.hideOnChildrenHidden,
    this.columnMetadataId,
    this.udfValue,
    this.defaultValue,
    this.format,
    this.enableMinDateInput,
    this.datePicker,
    this.enableMaxDateInput,
    this.enableTime,
    this.widget,
    this.autoExpand,
    this.mask,
    this.spellcheck,
    this.delimiter,
    this.requireDecimal,
    this.inputFormat,
    this.loadTable,
    this.parameterCode,
    this.dataSrc,
    this.data,
    this.valueProperty,
    this.idPath,
    this.template,
    this.selectThreshold,
    this.indexeddb,
    this.allTable,
    this.isDependantComponent,
    this.mapId,
    this.mapValue,
    this.disableLimit,
    this.hidden,
    this.storage,
    this.url,
    this.webcam,
    this.fileTypes,
    this.conditional,
    this.columns,
    this.values,
    this.disabled,
    this.inline,
    this.inputMask,
    this.onChangeServerLogic,
    this.optionsLabelPosition,
    this.refreshOn,
    this.rowDataValue,
    this.content,
    this.multiple,
  });

  String? label;
  String? chartItemName;
  bool? tableView;
  NtsType? ntsType;
  List<EditableContext>? editableContext;
  List<EditableContext>? viewableContext;
  // List<AbleBy>? viewableBy;
  List<AbleBy>? editableBy;
  Validate? validate;
  String? key;
  String? type;
  bool? input;
  bool? hideOnChildrenHidden;
  String? columnMetadataId;
  String? udfValue;
  dynamic defaultValue;
  String? format;
  bool? enableMinDateInput;
  DatePicker? datePicker;
  bool? enableMaxDateInput;
  bool? enableTime;
  WidgetClass? widget;
  bool? autoExpand;
  bool? mask;
  bool? spellcheck;
  bool? delimiter;
  bool? requireDecimal;
  String? inputFormat;
  String? loadTable;
  String? parameterCode;
  DataSrc? dataSrc;
  Data? data;
  String? valueProperty;
  String? idPath;
  String? template;
  double? selectThreshold;
  Indexeddb? indexeddb;
  String? allTable;
  bool? isDependantComponent;
  String? mapId;
  String? mapValue;
  bool? disableLimit;
  bool? hidden;
  DataSrc? storage;
  String? url;
  bool? webcam;
  List<FileTypeData>? fileTypes;
  Conditional? conditional;
  List<Columns>? columns;
  List<Value>? values;
  bool? disabled;
  String? inputMask;
  String? optionsLabelPosition;
  bool? inline;
  String? onChangeServerLogic;
  String? rowDataValue;
  String? refreshOn;
  String? content;
  bool? multiple;
  // WidgetEnum? widget;

  factory ColumnComponent.fromJson(Map<String, dynamic> json) =>
      ColumnComponent(
        columns: json["columns"] == null
            ? null
            : List<Columns>.from(
                json["columns"].map((x) => Columns.fromJson(x))),
        label: json["label"],
        chartItemName: json["chartItemName"],
        tableView: json["tableView"],
        ntsType: ntsTypeValues.map[json["ntsType"]],
        // editableContext: json["editableContext"] != null // TODO: fix null issue here
        //     ? List<EditableContext>.from(json["editableContext"]
        //         .map((x) => editableContextValues.map[x]))
        //     : null,
        // viewableContext: json["viewableContext"] != null
        //     ? List<ViewableContext>.from(json["viewableContext"]
        //         .map((x) => viewableContextValues.map[x]))
        //     : null,
        // viewableBy: json["viewableBy"] != null && json["viewableBy"].isNotEmpty
        //     ? List<AbleBy>.from(
        //         json["viewableBy"].map((x) => ableByValues.map[x]))
        //     : null,
        // editableBy: json["editableBy"] != null //TODO: fix the null issue here
        //     ? List<AbleBy>.from(
        //         json["editableBy"].map((x) => ableByValues.map[x]))
        //     : null,
        key: json["key"],
        type: json["type"],
        input: json["input"],
        hideOnChildrenHidden: json["hideOnChildrenHidden"],
        columnMetadataId: json["columnMetadataId"],
        udfValue: json["udfValue"],
        defaultValue:
            json["defaultValue"], // == null ? null : json["defaultValue"],
        format: json["format"] == null ? null : json["format"],
        enableMinDateInput: json["enableMinDateInput"] == null
            ? null
            : json["enableMinDateInput"],
        datePicker: json["datePicker"] == null
            ? null
            : DatePicker.fromJson(json["datePicker"]),
        enableMaxDateInput: json["enableMaxDateInput"] == null
            ? null
            : json["enableMaxDateInput"],
        enableTime: json["enableTime"] == null ? null : json["enableTime"],
        // widget: json["widget"] == null
        //     ? null
        //     : WidgetClass.fromJson(json["widget"]),
        widget: json["widget"] == null
            ? null
            : json["widget"] is String
                ? null
                : WidgetClass.fromJson(json["widget"]),
        autoExpand: json["autoExpand"] == null ? null : json["autoExpand"],
        mask: json["mask"] == null ? null : json["mask"],
        spellcheck: json["spellcheck"] == null ? null : json["spellcheck"],
        delimiter: json["delimiter"] == null ? null : json["delimiter"],
        requireDecimal:
            json["requireDecimal"] == null ? null : json["requireDecimal"],
        inputFormat: json["inputFormat"] == null ? null : json["inputFormat"],
        loadTable: json["loadTable"] == null ? null : json["loadTable"],
        parameterCode:
            json["parameterCode"] == null ? null : json["parameterCode"],
        dataSrc:
            json["dataSrc"] == null ? null : dataSrcValues.map[json["dataSrc"]],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        valueProperty:
            json["valueProperty"] == null ? null : json["valueProperty"],
        idPath: json["idPath"] == null ? null : json["idPath"],
        template: json["template"] == null ? null : json["template"],
        selectThreshold: json["selectThreshold"]?.toDouble(),
        indexeddb: json["indexeddb"] == null
            ? null
            : Indexeddb.fromJson(json["indexeddb"]),
        allTable: json["allTable"] == null ? null : json["allTable"],
        isDependantComponent: json["isDependantComponent"] == null
            ? null
            : json["isDependantComponent"],
        mapId: json["mapId"] == null ? null : json["mapId"],
        mapValue: json["mapValue"] == null ? null : json["mapValue"],
        disableLimit:
            json["disableLimit"] == null ? null : json["disableLimit"],
        hidden: json["hidden"] == null ? null : json["hidden"],
        storage:
            json["storage"] == null ? null : dataSrcValues.map[json["storage"]],
        url: json["url"] == null ? null : json["url"],
        webcam: json["webcam"] == null ? null : json["webcam"],
        fileTypes: json["fileTypes"] == null
            ? null
            : List<FileTypeData>.from(
                json["fileTypes"].map((x) => FileTypeData.fromJson(x))),
        conditional: json["conditional"] == null
            ? null
            : Conditional.fromJson(json["conditional"]),
        validate: json["validate"] == null
            ? null
            : Validate.fromJson(json["validate"]),
        values: json["values"] == null
            ? null
            : List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        disabled: json["disabled"] == null ? null : json["disabled"],
        inputMask: json["inputMask"] == null ? null : json["inputMask"],
        optionsLabelPosition: json["optionsLabelPosition"] == null
            ? null
            : json["optionsLabelPosition"],
        inline: json["inline"] == null ? null : json["inline"],
        onChangeServerLogic: json["onChangeServerLogic"] == null
            ? null
            : json["onChangeServerLogic"],
        rowDataValue:
            json["rowDataValue"] == null ? null : json["rowDataValue"],
        refreshOn: json["refreshOn"] == null ? null : json["refreshOn"],
        content: json["content"],
        multiple: json["multiple"],
      );

  Map<String, dynamic> toJson() => {
        "columns": columns == null
            ? null
            : List<dynamic>.from(columns!.map((x) => x.toJson())),
        "label": label,
        "chartItemName": chartItemName,
        "tableView": tableView,
        "ntsType": ntsTypeValues.reverse[ntsType],
        "editableContext": List<dynamic>.from(
            editableContext!.map((x) => editableContextValues.reverse[x])),
        "viewableContext": List<dynamic>.from(
            viewableContext!.map((x) => editableContextValues.reverse[x])),
        // "viewableBy":
        //     List<dynamic>.from(viewableBy!.map((x) => ableByValues.reverse[x])),
        "editableBy":
            List<dynamic>.from(editableBy!.map((x) => ableByValues.reverse[x])),
        "validate": validate == null ? null : validate!.toJson(),
        "key": key,
        "type": type,
        "input": input,
        "hideOnChildrenHidden": hideOnChildrenHidden,
        "columnMetadataId": columnMetadataId,
        "udfValue": udfValue,
        "defaultValue": defaultValue == null ? null : defaultValue,
        "format": format == null ? null : format,
        "enableMinDateInput":
            enableMinDateInput == null ? null : enableMinDateInput,
        "datePicker": datePicker == null ? null : datePicker!.toJson(),
        "enableMaxDateInput":
            enableMaxDateInput == null ? null : enableMaxDateInput,
        "enableTime": enableTime == null ? null : enableTime,
        "widget": widget == null ? null : widget!.toJson(),
        "autoExpand": autoExpand == null ? null : autoExpand,
        "mask": mask == null ? null : mask,
        "spellcheck": spellcheck == null ? null : spellcheck,
        "delimiter": delimiter == null ? null : delimiter,
        "requireDecimal": requireDecimal == null ? null : requireDecimal,
        "inputFormat": inputFormat == null ? null : inputFormat,
        "loadTable": loadTable == null ? null : loadTable,
        "parameterCode": parameterCode == null ? null : parameterCode,
        "dataSrc": dataSrc == null ? null : dataSrcValues.reverse[dataSrc],
        "data": data == null ? null : data!.toJson(),
        "valueProperty": valueProperty == null ? null : valueProperty,
        "idPath": idPath == null ? null : idPath,
        "template": template == null ? null : template,
        "selectThreshold": selectThreshold == null ? null : selectThreshold,
        "indexeddb": indexeddb == null ? null : indexeddb!.toJson(),
        "allTable": allTable == null ? null : allTable,
        "isDependantComponent":
            isDependantComponent == null ? null : isDependantComponent,
        "mapId": mapId == null ? null : mapId,
        "mapValue": mapValue == null ? null : mapValue,
        "disableLimit": disableLimit == null ? null : disableLimit,
        "hidden": hidden == null ? null : hidden,
        "storage": storage == null ? null : dataSrcValues.reverse[storage],
        "url": url == null ? null : url,
        "webcam": webcam == null ? null : webcam,
        "fileTypes": fileTypes == null
            ? null
            : List<dynamic>.from(fileTypes!.map((x) => x.toJson())),
        "conditional": conditional == null ? null : conditional!.toJson(),
        "values": List<dynamic>.from(values!.map((x) => x.toJson())),
        "disabled": disabled == null ? null : disabled,
        "inputMask": inputMask == null ? null : inputMask,
        "optionsLabelPosition":
            optionsLabelPosition == null ? null : optionsLabelPosition,
        "inline": inline == null ? null : inline,
        "onChangeServerLogic":
            onChangeServerLogic == null ? null : onChangeServerLogic,
        "rowDataValue": rowDataValue == null ? null : rowDataValue,
        "refreshOn": refreshOn == null ? null : refreshOn,
      };
}

class Conditional {
  Conditional({
    this.show,
    this.when,
    this.eq,
  });

  bool? show;
  String? when;
  String? eq;

  factory Conditional.fromJson(Map<String, dynamic> json) => Conditional(
        show: json["show"],
        when: json["when"],
        eq: json["eq"],
      );

  Map<String, dynamic> toJson() => {
        "show": show,
        "when": when,
        "eq": eq,
      };
}

class Data {
  Data({
    this.url,
    this.headers,
    this.values,
  });

  String? url;
  List<Header>? headers;
  List<FileTypeData>? values;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        url: json["url"],
        headers: json["headers"] == null
            ? null
            : List<Header>.from(json["headers"].map((x) => Header.fromJson(x))),
        values: json["values"] == null
            ? null
            : List<FileTypeData>.from(
                json["values"].map((x) => FileTypeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "headers": List<dynamic>.from(headers!.map((x) => x.toJson())),
        "values": values == null
            ? null
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class Header {
  Header({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class FileTypeData {
  FileTypeData({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory FileTypeData.fromJson(Map<String, dynamic> json) => FileTypeData(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

enum DataSrc { URL }

final dataSrcValues = EnumValues({"url": DataSrc.URL});

class DatePicker {
  DatePicker({
    this.disableWeekends,
    this.disableWeekdays,
  });

  bool? disableWeekends;
  bool? disableWeekdays;

  factory DatePicker.fromJson(Map<String, dynamic> json) => DatePicker(
        disableWeekends: json["disableWeekends"],
        disableWeekdays: json["disableWeekdays"],
      );

  Map<String, dynamic> toJson() => {
        "disableWeekends": disableWeekends,
        "disableWeekdays": disableWeekdays,
      };
}

enum AbleBy { REQUESTER, OWNER, SHARED_WITH, ALL, ASSIGNEE, OWNERORREQUESTER }

final ableByValues = EnumValues({
  "All": AbleBy.ALL,
  "Assignee": AbleBy.ASSIGNEE,
  "Owner": AbleBy.OWNER,
  "Requester": AbleBy.REQUESTER,
  "OwnerOrRequester": AbleBy.OWNERORREQUESTER,
  "SharedWith": AbleBy.SHARED_WITH,
});

enum EditableContext {
  SERVICE_STATUS_OVERDUE,
  SERVICE_STATUS_DRAFT,
  SERVICE_STATUS_INPROGRESS,
  SERVICE_STATUS_CLOSE
}

final editableContextValues = EnumValues({
  "SERVICE_STATUS_CLOSE": EditableContext.SERVICE_STATUS_CLOSE,
  "SERVICE_STATUS_DRAFT": EditableContext.SERVICE_STATUS_DRAFT,
  "SERVICE_STATUS_INPROGRESS": EditableContext.SERVICE_STATUS_INPROGRESS,
  "SERVICE_STATUS_OVERDUE": EditableContext.SERVICE_STATUS_OVERDUE
});

class Indexeddb {
  Indexeddb({
    this.filter,
  });

  Filter? filter;

  factory Indexeddb.fromJson(Map<String, dynamic> json) => Indexeddb(
        filter: Filter.fromJson(json["filter"]),
      );

  Map<String, dynamic> toJson() => {
        "filter": filter!.toJson(),
      };
}

class Filter {
  Filter();

  factory Filter.fromJson(Map<String, dynamic> json) => Filter();

  Map<String, dynamic> toJson() => {};
}

enum NtsType { LOV_SERVICE_STATUS }

final ntsTypeValues =
    EnumValues({"LOV_SERVICE_STATUS": NtsType.LOV_SERVICE_STATUS});

class Validate {
  Validate({
    this.required,
    this.onlyAvailableItems,
  });

  bool? required;
  bool? onlyAvailableItems;

  factory Validate.fromJson(Map<String, dynamic> json) => Validate(
        required: json["required"] == null ? null : json["required"],
        onlyAvailableItems: json["onlyAvailableItems"] == null
            ? null
            : json["onlyAvailableItems"],
      );

  Map<String, dynamic> toJson() => {
        "required": required == null ? null : required,
        "onlyAvailableItems":
            onlyAvailableItems == null ? null : onlyAvailableItems,
      };
}

enum ViewableContext { SERVICE_STATUS_ALL }

final viewableContextValues =
    EnumValues({"SERVICE_STATUS_ALL": ViewableContext.SERVICE_STATUS_ALL});

class WidgetClass {
  WidgetClass({
    this.type,
    this.displayInTimezone,
    this.locale,
    this.useLocaleSettings,
    this.allowInput,
    this.mode,
    this.enableTime,
    this.noCalendar,
    this.format,
    this.hourIncrement,
    this.minuteIncrement,
    this.time24Hr,
    this.minDate,
    this.disableWeekends,
    this.disableWeekdays,
    this.maxDate,
  });

  String? type;
  String? displayInTimezone;
  String? locale;
  bool? useLocaleSettings;
  bool? allowInput;
  String? mode;
  bool? enableTime;
  bool? noCalendar;
  String? format;
  int? hourIncrement;
  int? minuteIncrement;
  bool? time24Hr;
  DateTime? minDate;
  bool? disableWeekends;
  bool? disableWeekdays;
  DateTime? maxDate;

  factory WidgetClass.fromJson(Map<String, dynamic> json) => WidgetClass(
        type: json["type"],
        displayInTimezone: json["displayInTimezone"],
        locale: json["locale"],
        useLocaleSettings: json["useLocaleSettings"],
        allowInput: json["allowInput"],
        mode: json["mode"],
        enableTime: json["enableTime"],
        noCalendar: json["noCalendar"],
        format: json["format"],
        hourIncrement: json["hourIncrement"],
        minuteIncrement: json["minuteIncrement"],
        time24Hr: json["time_24hr"],
        minDate: json["minDate"],
        disableWeekends: json["disableWeekends"],
        disableWeekdays: json["disableWeekdays"],
        maxDate: json["maxDate"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "displayInTimezone": displayInTimezone,
        "locale": locale,
        "useLocaleSettings": useLocaleSettings,
        "allowInput": allowInput,
        "mode": mode,
        "enableTime": enableTime,
        "noCalendar": noCalendar,
        "format": format,
        "hourIncrement": hourIncrement,
        "minuteIncrement": minuteIncrement,
        "time_24hr": time24Hr,
        "minDate": minDate,
        "disableWeekends": disableWeekends,
        "disableWeekdays": disableWeekdays,
        "maxDate": maxDate,
      };
}

enum SizeValue { MD }

final sizeValues = EnumValues({"md": SizeValue.MD});

class FluffyComponent {
  FluffyComponent({
    this.label,
    this.optionsLabelPosition,
    this.inline,
    this.tableView,
    this.values,
    this.ntsType,
    this.editableContext,
    this.viewableContext,
    // this.viewableBy,
    this.editableBy,
    this.validate,
    this.key,
    this.type,
    this.input,
    this.columnMetadataId,
    this.defaultValue,
    this.udfValue,
    this.content,
  });

  String? label;
  String? optionsLabelPosition;
  bool? inline;
  bool? tableView;
  List<Value>? values;
  NtsType? ntsType;
  List<EditableContext>? editableContext;
  List<ViewableContext>? viewableContext;
  // List<AbleBy>? viewableBy;
  List<AbleBy>? editableBy;
  Validate? validate;
  String? key;
  String? type;
  bool? input;
  String? columnMetadataId;
  dynamic defaultValue;
  String? udfValue;
  String? content;

  factory FluffyComponent.fromJson(Map<String, dynamic> json) =>
      FluffyComponent(
        label: json["label"],
        optionsLabelPosition: json["optionsLabelPosition"],
        inline: json["inline"],
        tableView: json["tableView"],
        values: json["values"] != null
            ? List<Value>.from(json["values"].map((x) => Value.fromJson(x)))
            : null,
        ntsType: ntsTypeValues.map[json["ntsType"]],
        editableContext: json["editableContext"] != null
            ? List<EditableContext>.from(json["editableContext"]
                .map((x) => editableContextValues.map[x]))
            : null,
        viewableContext: json["viewableContext"] != null
            ? List<ViewableContext>.from(json["viewableContext"]
                .map((x) => viewableContextValues.map[x]))
            : null,
        // viewableBy: json["viewableBy"] != null
        //     ? List<AbleBy>.from(
        //         json["viewableBy"].map((x) => ableByValues.map[x]))
        //     : null,
        editableBy: json["editableBy"] != null
            ? List<AbleBy>.from(
                json["editableBy"].map((x) => ableByValues.map[x]))
            : null,
        validate: json["validate"] != null
            ? Validate.fromJson(json["validate"])
            : null,
        key: json["key"],
        type: json["type"],
        input: json["input"],
        columnMetadataId: json["columnMetadataId"],
        defaultValue: json["defaultValue"],
        // json["defaultValue"] == null ? null : json["defaultValue"],
        udfValue: json["udfValue"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "optionsLabelPosition": optionsLabelPosition,
        "inline": inline,
        "tableView": tableView,
        "values": List<dynamic>.from(values!.map((x) => x.toJson())),
        "ntsType": ntsTypeValues.reverse[ntsType],
        "editableContext": List<dynamic>.from(
            editableContext!.map((x) => editableContextValues.reverse[x])),
        "viewableContext": List<dynamic>.from(
            viewableContext!.map((x) => viewableContextValues.reverse[x])),
        // "viewableBy":
        //     List<dynamic>.from(viewableBy!.map((x) => ableByValues.reverse[x])),
        "editableBy":
            List<dynamic>.from(editableBy!.map((x) => ableByValues.reverse[x])),
        "validate": validate!.toJson(),
        "key": key,
        "type": type,
        "input": input,
        "columnMetadataId": columnMetadataId,
        "defaultValue": defaultValue == null ? null : defaultValue,
        "udfValue": udfValue,
      };
}

class Value {
  Value({
    this.label,
    this.value,
    this.shortcut,
  });

  String? label;
  String? value;
  String? shortcut;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        label: json["label"],
        value: json["value"],
        shortcut: json["shortcut"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "shortcut": shortcut,
      };
}

enum LabelType { COLUMNS, EMPTY }

final labelValues =
    EnumValues({"Columns": LabelType.COLUMNS, "": LabelType.EMPTY});

enum Type { COLUMNS, FIELDSET, NUMBER, TEXTFIELD, SELECT }

final typeValues = EnumValues({
  "columns": Type.COLUMNS,
  "fieldset": Type.FIELDSET,
  "number": Type.NUMBER,
  "select": Type.SELECT,
  "textfield": Type.TEXTFIELD
});

// enum MapValue { NAME }

// final mapValueValues = EnumValues({"Name": MapValue.NAME});

// enum IdPath { ID, NAME, UDF_NOTE_TABLE_ID }

// final idPathValues = EnumValues({
//   "Id": IdPath.ID,
//   "Name": IdPath.NAME,
//   "UdfNoteTableId": IdPath.UDF_NOTE_TABLE_ID
// });

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

class ComponentComponent {
  String? label;
  bool? tableView;
  String? ntsType;
  List<String>? editableContext;
  List<String>? viewableContext;
  // List<String>? viewableBy;
  List<String>? editableBy;
  String? key;
  String? type;
  bool? input;
  bool? disabled;
  String? columnMetadataId;
  bool? autoExpand;
  Validate? validate;
  String? value;
  String? udfValue;
  String? template;
  String? idPath;
  Data? data;

  ComponentComponent(
      {this.label,
      this.tableView,
      this.ntsType,
      this.editableContext,
      this.viewableContext,
      // this.viewableBy,
      this.editableBy,
      this.key,
      this.type,
      this.input,
      this.disabled,
      this.columnMetadataId,
      this.autoExpand,
      this.validate,
      this.value,
      this.udfValue,
      this.template,
      this.idPath,
      this.data});

  ComponentComponent.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tableView = json['tableView'];
    ntsType = json['ntsType'];
    if (json.containsKey('editableContext')) {
      editableContext = (json['editableContext'] != null)
          ? json['editableContext'].cast<String>()
          : '' as List<String>?;
    }
    if (json.containsKey('viewableContext')) {
      viewableContext = (json['viewableContext'] != null)
          ? json['viewableContext'].cast<String>()
          : '' as List<String>?;
    }
    // if (json.containsKey('viewableBy')) {
    //   viewableBy = (json['viewableBy'] != null)
    //       ? json['viewableBy'].cast<String>()
    //       : '' as List<String>?;
    // }
    if (json.containsKey('editableBy')) {
      editableBy = (json['editableBy'] != null)
          ? json['editableBy'].cast<String>()
          : '' as List<String>?;
    }
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    disabled = json['disabled'] ?? false;
    key = json['key'];
    type = json['type'];
    input = json['input'];
    columnMetadataId = json['columnMetadataId'];
    autoExpand = json['autoExpand'];
    validate =
        json['validate'] != null ? Validate.fromJson(json['validate']) : null;
    value = json['value'];
    udfValue = json['udfValue'];
    template = json['template'];
    idPath = json['idPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['label'] = label;
    data['tableView'] = tableView;
    data['ntsType'] = ntsType;
    data['editableContext'] = editableContext;
    data['viewableContext'] = viewableContext;
    // data['viewableBy'] = viewableBy;
    data['editableBy'] = editableBy;
    data['disabled'] = key;
    data['key'] = key;
    data['type'] = type;
    data['input'] = input;
    data['columnMetadataId'] = columnMetadataId;
    data['autoExpand'] = autoExpand;
    if (validate != null) {
      data['validate'] = validate!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['value'] = value;
    data['udfValue'] = udfValue;
    data['template'] = template;
    data['idPath'] = idPath;
    return data;
  }
}
