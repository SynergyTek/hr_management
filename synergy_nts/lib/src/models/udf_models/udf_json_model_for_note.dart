import 'dart:convert';

UdfJsonForNote udfJsonFromJsonForNote(String str) => UdfJsonForNote.fromJson(json.decode(str));

String udfJsonToJsonForNote(UdfJsonForNote data) => json.encode(data.toJson());

class UdfJsonForNote {
  UdfJsonForNote({
    this.components,
  });

  List<UdfJsonComponentForNote>? components;

  factory UdfJsonForNote.fromJson(Map<String, dynamic> json) => UdfJsonForNote(
        components: json["components"] == null
            ? null
            : List<UdfJsonComponentForNote>.from(
                json["components"].map(
                  (x) => UdfJsonComponentForNote.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "components": List<UdfJsonComponentForNote>.from(
          components!.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class UdfJsonComponentForNote {
  UdfJsonComponentForNote({
    this.label,
    this.columns,
    this.key,
    this.type,
    this.input,
    this.tableView,
    this.components,
    this.title,
    this.data,
    this.idPath,
    this.template,
    this.inputFormat,
    this.validate,
    this.value,
    this.udfValue,
    this.disabled,
    this.hidden,
  });

  String? label;
  List<ColumnsForNote>? columns;
  String? key;
  String? type;
  Data? data;
  bool? input;
  bool? tableView;
  List<ComponentComponentForNote>? components;
  String? title;
  bool? disabled;
  bool? hidden;
  String? idPath;
  String? template;
  String? inputFormat;
  Validate? validate;
  String? value;
  String? udfValue;

  factory UdfJsonComponentForNote.fromJson(Map<String, dynamic> json) =>
      UdfJsonComponentForNote(
        label: json["label"],
        columns: json["columns"] == null
            ? null
            : List<ColumnsForNote>.from(
                json["columns"].map((x) => ColumnsForNote.fromJson(x))),
        key: json["key"],
        type: json["type"],
        input: json["input"],
        tableView: json["tableView"],
        components: json["components"] == null
            ? null
            : List<ComponentComponentForNote>.from(
                json["components"].map((x) => ComponentComponentForNote.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
        idPath: json['idPath'],
        template: json['template'],
        inputFormat: json['inputFormat'],
        validate: json['validate'] != null
            ? Validate.fromJson(json['validate'])
            : null,
        value: json['value'],
        udfValue: json['udfValue'],
        disabled: json['disabled'] ?? false,
        hidden: json['hidden'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "columns": columns == null
            ? null
            : List<ColumnsForNote>.from(columns!.map((x) => x.toJson())),
        "key": key,
        "type": type,
        "input": input,
        "tableView": tableView,
        "components": components == null
            ? null
            : List<ComponentComponentForNote>.from(components!.map((x) => x.toJson())),
        "title": title == null ? null : title,
        'data': this.data != null ? this.data!.toJson() : null,
        'idPath': this.idPath,
        'template': this.template,
        'inputFormat': this.inputFormat,
        'validate':
            this.validate!.toJson() != null ? this.validate!.toJson() : null,
        'value': this.value,
        'udfValue': this.udfValue,
        'disabled': this.disabled,
        'hidden': this.hidden,
      };
}

class ColumnsForNote {
  ColumnsForNote({
    this.components,
    this.width,
    this.offset,
    this.push,
    this.pull,
    this.size,
  });

  List<ColumnComponentForNote>? components;
  int? width;
  int? offset;
  int? push;
  int? pull;
  String? size;

  factory ColumnsForNote.fromJson(Map<String, dynamic> json) => ColumnsForNote(
        components: List<ColumnComponentForNote>.from(
            json["components"].map((x) => ColumnComponentForNote.fromJson(x))),
        width: json["width"],
        offset: json["offset"],
        push: json["push"],
        pull: json["pull"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "components":
            List<ColumnComponentForNote>.from(components!.map((x) => x.toJson())),
        "width": width,
        "offset": offset,
        "push": push,
        "pull": pull,
        "size": size,
      };
}

class ColumnComponentForNote {
  ColumnComponentForNote(
      {this.label,
      this.tableView,
      this.ntsType,
      this.editableContext,
      this.viewableContext,
      this.viewableBy,
      this.editableBy,
      this.key,
      this.type,
      this.input,
      this.hideOnChildrenHidden,
      this.columnMetadataId,
      this.format,
      this.enableMinDateInput,
      this.datePicker,
      this.enableMaxDateInput,
      this.enableTime,
      this.onChangeServerLogic,
      this.validate,
      this.widget,
      this.mask,
      this.spellcheck,
      this.disabled,
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
      this.isDependantComponent,
      this.disableLimit,
      this.allTable,
      this.mapId,
      this.mapValue,
      this.rowDataValue,
      this.autoExpand,
      this.value,
      this.udfValue,
      this.fileTypes});

  String? label;
  bool? tableView;
  String? ntsType;
  List<String>? editableContext;
  List<String>? viewableContext;
  List<String>? viewableBy;
  List<String>? editableBy;
  String? key;
  String? type;
  bool? input;
  bool? hideOnChildrenHidden;
  String? columnMetadataId;
  String? format;
  bool? enableMinDateInput;
  DatePicker? datePicker;
  bool? enableMaxDateInput;
  bool? enableTime;
  String? onChangeServerLogic;
  Validate? validate;
  WidgetClass? widget;
  bool? mask;
  bool? spellcheck;
  bool? disabled;
  bool? delimiter;
  bool? requireDecimal;
  String? inputFormat;
  String? loadTable;
  String? parameterCode;
  String? dataSrc;
  Data? data;
  String? valueProperty;
  String? idPath;
  String? template;
  double? selectThreshold;
  Indexeddb? indexeddb;
  bool? isDependantComponent;
  bool? disableLimit;
  String? allTable;
  String? mapId;
  String? mapValue;
  String? rowDataValue;
  bool? autoExpand;
  String? value;
  String? udfValue;
  List<FileTypeData>? fileTypes;

  ColumnComponentForNote.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tableView = json['tableView'];
    ntsType = json['ntsType'];
    if (json.containsKey('editableContext'))
      editableContext = (json['editableContext'] != null &&
              json['editableContext'].isNotEmpty)
          ? json['editableContext'].cast<String>()
          : '' as List<String>?;
    if (json.containsKey('viewableContext'))
      viewableContext = (json['viewableContext'] != null &&
              json['viewableContext'].isNotEmpty)
          ? json['viewableContext'].cast<String>()
          : '' as List<String>?;
    if (json.containsKey('viewableBy'))
      viewableBy = (json['viewableBy'] != null && json['viewableBy'].isNotEmpty)
          ? json['viewableBy'].cast<String>()
          : '' as List<String>?;
    if (json.containsKey('editableBy'))
      editableBy = (json['editableBy'] != null && json['editableBy'].isNotEmpty)
          ? json['editableBy'].cast<String>()
          : '' as List<String>?;
    key = json['key'];
    type = json['type'];
    input = json['input'];
    hideOnChildrenHidden = json['hideOnChildrenHidden'];
    columnMetadataId = json['columnMetadataId'];
    format = json['format'];
    enableMinDateInput = json['enableMinDateInput'];
    datePicker = json['datePicker'] != null
        ? DatePicker.fromJson(json['datePicker'])
        : null;
    enableMaxDateInput = json['enableMaxDateInput'];
    enableTime = json['enableTime'];
    onChangeServerLogic = json['onChangeServerLogic'];
    validate =
        json['validate'] != null ? Validate.fromJson(json['validate']) : null;
    widget = null;
    //     // json['widget'] != null ? WidgetClass.fromJson(json['widget']) : null;
    mask = json['mask'];
    spellcheck = json['spellcheck'];
    disabled = json['disabled'] ?? false;
    delimiter = json['delimiter'];
    requireDecimal = json['requireDecimal'];
    inputFormat = json['inputFormat'];
    loadTable = json['loadTable'];
    parameterCode = json['parameterCode'];
    dataSrc = json['dataSrc'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    valueProperty = json['valueProperty'];
    idPath = json['idPath'];
    template = json['template'];
    selectThreshold = json['selectThreshold'];
    indexeddb = json['indexeddb'] != null
        ? Indexeddb.fromJson(json['indexeddb'])
        : null;
    isDependantComponent = json['isDependantComponent'];
    disableLimit = json['disableLimit'];
    allTable = json['allTable'];
    mapId = json['mapId'];
    mapValue = json['mapValue'];
    rowDataValue = json['rowDataValue'];
    autoExpand = json['autoExpand'];
    value = json['value'];
    udfValue = json['udfValue'];
    fileTypes:
    json["fileTypes"] == null
        ? null
        : List<FileTypeData>.from(
            json["fileTypes"].map((x) => FileTypeData.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['label'] = this.label;
    data['tableView'] = this.tableView;
    data['ntsType'] = this.ntsType;
    data['editableContext'] = this.editableContext;
    data['viewableContext'] = this.viewableContext;
    data['viewableBy'] = this.viewableBy;
    data['editableBy'] = this.editableBy;
    data['key'] = this.key;
    data['type'] = this.type;
    data['input'] = this.input;
    data['hideOnChildrenHidden'] = this.hideOnChildrenHidden;
    data['columnMetadataId'] = this.columnMetadataId;
    data['format'] = this.format;
    data['enableMinDateInput'] = this.enableMinDateInput;
    if (this.datePicker != null) {
      data['datePicker'] = this.datePicker!.toJson();
    }
    data['enableMaxDateInput'] = this.enableMaxDateInput;
    data['enableTime'] = this.enableTime;
    data['onChangeServerLogic'] = this.onChangeServerLogic;
    if (this.validate != null) {
      data['validate'] = this.validate!.toJson();
    }
    if (this.widget != null) {
      data['widget'] = this.widget!.toJson();
    }
    data['mask'] = this.mask;
    data['spellcheck'] = this.spellcheck;
    data['disabled'] = this.disabled;
    data['delimiter'] = this.delimiter;
    data['requireDecimal'] = this.requireDecimal;
    data['inputFormat'] = this.inputFormat;
    data['loadTable'] = this.loadTable;
    data['parameterCode'] = this.parameterCode;
    data['dataSrc'] = this.dataSrc;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['valueProperty'] = this.valueProperty;
    data['idPath'] = this.idPath;
    data['template'] = this.template;
    data['selectThreshold'] = this.selectThreshold;
    if (this.indexeddb != null) {
      data['indexeddb'] = this.indexeddb!.toJson();
    }
    data['isDependantComponent'] = this.isDependantComponent;
    data['disableLimit'] = this.disableLimit;
    data['allTable'] = this.allTable;
    data['mapId'] = this.mapId;
    data['mapValue'] = this.mapValue;
    data['rowDataValue'] = this.rowDataValue;
    data['autoExpand'] = this.autoExpand;
    data['value'] = this.value;
    data['udfValue'] = this.udfValue;

    return data;
  }
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

class Data {
  Data({
    this.values,
    this.url,
    this.headers,
    this.fileValues,
  });

  List<Value>? values;
  String? url;
  List<Header>? headers;
  List<FileTypeData>? fileValues;

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
        values: json?["values"] == null
            ? null
            : List<Value>.from(json?["values"].map((x) => Value.fromJson(x))),
        url: json?["url"],
        headers: json?["headers"] == null
            ? null
            : List<Header>.from(
                json?["headers"].map((x) => Header.fromJson(x))),
        fileValues: json?["values"] == null
            ? null
            : List<FileTypeData>.from(
                json?["values"].map((x) => FileTypeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "values": List<Header>.from(values!.map((x) => x.toJson())),
        "url": url,
        "headers": List<Header>.from(headers!.map((x) => x.toJson())),
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

class Value {
  Value({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

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

  factory Filter.fromJson(Map<String, dynamic>? json) => Filter();

  Map<String, dynamic> toJson() => {};
}

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
  dynamic minDate;
  bool? disableWeekends;
  bool? disableWeekdays;
  dynamic maxDate;

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

class ComponentComponentForNote {
  String? label;
  bool? tableView;
  String? ntsType;
  List<String>? editableContext;
  List<String>? viewableContext;
  List<String>? viewableBy;
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

  ComponentComponentForNote(
      {this.label,
      this.tableView,
      this.ntsType,
      this.editableContext,
      this.viewableContext,
      this.viewableBy,
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

  ComponentComponentForNote.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tableView = json['tableView'];
    ntsType = json['ntsType'];
    if (json.containsKey('editableContext'))
      editableContext = (json['editableContext'] != null)
          ? json['editableContext'].cast<String>()
          : '' as List<String>?;
    if (json.containsKey('viewableContext'))
      viewableContext = (json['viewableContext'] != null)
          ? json['viewableContext'].cast<String>()
          : '' as List<String>?;
    if (json.containsKey('viewableBy'))
      viewableBy = (json['viewableBy'] != null)
          ? json['viewableBy'].cast<String>()
          : '' as List<String>?;
    if (json.containsKey('editableBy'))
      editableBy = (json['editableBy'] != null)
          ? json['editableBy'].cast<String>()
          : '' as List<String>?;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['label'] = this.label;
    data['tableView'] = this.tableView;
    data['ntsType'] = this.ntsType;
    data['editableContext'] = this.editableContext;
    data['viewableContext'] = this.viewableContext;
    data['viewableBy'] = this.viewableBy;
    data['editableBy'] = this.editableBy;
    data['disabled'] = this.key;
    data['key'] = this.key;
    data['type'] = this.type;
    data['input'] = this.input;
    data['columnMetadataId'] = this.columnMetadataId;
    data['autoExpand'] = this.autoExpand;
    if (this.validate != null) {
      data['validate'] = this.validate!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['value'] = this.value;
    data['udfValue'] = this.udfValue;
    data['template'] = this.template;
    data['idPath'] = this.idPath;
    return data;
  }
}
