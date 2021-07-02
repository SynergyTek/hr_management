import 'dart:convert';

UdfJson udfJsonFromJson(String str) => UdfJson.fromJson(json.decode(str));

String udfJsonToJson(UdfJson data) => json.encode(data.toJson());

class UdfJson {
  UdfJson({
    this.components,
  });

  List<UdfJsonComponent> components;

  factory UdfJson.fromJson(Map<String, dynamic> json) => UdfJson(
        components: List<UdfJsonComponent>.from(
            json["components"].map((x) => UdfJsonComponent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "components":
            List<UdfJsonComponent>.from(components.map((x) => x.toJson())),
      };
}

class UdfJsonComponent {
  UdfJsonComponent({
    this.label,
    this.columns,
    this.key,
    this.type,
    this.input,
    this.tableView,
    this.components,
    this.title,
  });

  String label;
  List<Columns> columns;
  String key;
  String type;
  bool input;
  bool tableView;
  List<ComponentComponent> components;
  String title;

  factory UdfJsonComponent.fromJson(Map<String, dynamic> json) =>
      UdfJsonComponent(
        label: json["label"],
        columns: json["columns"] == null
            ? null
            : List<Columns>.from(
                json["columns"].map((x) => Columns.fromJson(x))),
        key: json["key"],
        type: json["type"],
        input: json["input"],
        tableView: json["tableView"],
        components: json["components"] == null
            ? null
            : List<ComponentComponent>.from(
                json["components"].map((x) => ComponentComponent.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "columns": columns == null
            ? null
            : List<Columns>.from(columns.map((x) => x.toJson())),
        "key": key,
        "type": type,
        "input": input,
        "tableView": tableView,
        "components": components == null
            ? null
            : List<ComponentComponent>.from(components.map((x) => x.toJson())),
        "title": title == null ? null : title,
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

  List<ColumnComponent> components;
  int width;
  int offset;
  int push;
  int pull;
  String size;

  factory Columns.fromJson(Map<String, dynamic> json) => Columns(
        components: List<ColumnComponent>.from(
            json["components"].map((x) => ColumnComponent.fromJson(x))),
        width: json["width"],
        offset: json["offset"],
        push: json["push"],
        pull: json["pull"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "components":
            List<ColumnComponent>.from(components.map((x) => x.toJson())),
        "width": width,
        "offset": offset,
        "push": push,
        "pull": pull,
        "size": size,
      };
}

class ColumnComponent {
  ColumnComponent({
    this.label,
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
  });

  String label;
  bool tableView;
  String ntsType;
  List<String> editableContext;
  List<String> viewableContext;
  List<String> viewableBy;
  List<String> editableBy;
  String key;
  String type;
  bool input;
  bool hideOnChildrenHidden;
  String columnMetadataId;
  String format;
  bool enableMinDateInput;
  DatePicker datePicker;
  bool enableMaxDateInput;
  bool enableTime;
  String onChangeServerLogic;
  Validate validate;
  WidgetClass widget;
  bool mask;
  bool spellcheck;
  bool disabled;
  bool delimiter;
  bool requireDecimal;
  String inputFormat;
  String loadTable;
  String parameterCode;
  String dataSrc;
  Data data;
  String valueProperty;
  String idPath;
  String template;
  double selectThreshold;
  Indexeddb indexeddb;
  bool isDependantComponent;
  bool disableLimit;
  String allTable;
  String mapId;
  String mapValue;
  String rowDataValue;
  bool autoExpand;

  ColumnComponent.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tableView = json['tableView'];
    ntsType = json['ntsType'];
    editableContext = json['editableContext'].cast<String>();
    viewableContext = json['viewableContext'].cast<String>();
    viewableBy = json['viewableBy'].cast<String>();
    editableBy = json['editableBy'].cast<String>();
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
    disabled = json['disabled'];
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
      data['datePicker'] = this.datePicker.toJson();
    }
    data['enableMaxDateInput'] = this.enableMaxDateInput;
    data['enableTime'] = this.enableTime;
    data['onChangeServerLogic'] = this.onChangeServerLogic;
    if (this.validate != null) {
      data['validate'] = this.validate.toJson();
    }
    if (this.widget != null) {
      data['widget'] = this.widget.toJson();
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
      data['data'] = this.data.toJson();
    }
    data['valueProperty'] = this.valueProperty;
    data['idPath'] = this.idPath;
    data['template'] = this.template;
    data['selectThreshold'] = this.selectThreshold;
    if (this.indexeddb != null) {
      data['indexeddb'] = this.indexeddb.toJson();
    }
    data['isDependantComponent'] = this.isDependantComponent;
    data['disableLimit'] = this.disableLimit;
    data['allTable'] = this.allTable;
    data['mapId'] = this.mapId;
    data['mapValue'] = this.mapValue;
    data['rowDataValue'] = this.rowDataValue;
    data['autoExpand'] = this.autoExpand;
    return data;
  }
}

class Data {
  Data({
    this.values,
    this.url,
    this.headers,
  });

  List<Value> values;
  String url;
  List<Header> headers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        url: json["url"],
        headers:
            List<Header>.from(json["headers"].map((x) => Header.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "values": List<Header>.from(values.map((x) => x.toJson())),
        "url": url,
        "headers": List<Header>.from(headers.map((x) => x.toJson())),
      };
}

class Header {
  Header({
    this.key,
    this.value,
  });

  String key;
  String value;

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

  String label;
  String value;

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

  bool disableWeekends;
  bool disableWeekdays;

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

  Filter filter;

  factory Indexeddb.fromJson(Map<String, dynamic> json) => Indexeddb(
        filter: Filter.fromJson(json["filter"]),
      );

  Map<String, dynamic> toJson() => {
        "filter": filter.toJson(),
      };
}

class Filter {
  Filter();

  factory Filter.fromJson(Map<String, dynamic> json) => Filter();

  Map<String, dynamic> toJson() => {};
}

class Validate {
  Validate({
    this.required,
    this.onlyAvailableItems,
  });

  bool required;
  bool onlyAvailableItems;

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

  String type;
  String displayInTimezone;
  String locale;
  bool useLocaleSettings;
  bool allowInput;
  String mode;
  bool enableTime;
  bool noCalendar;
  String format;
  int hourIncrement;
  int minuteIncrement;
  bool time24Hr;
  dynamic minDate;
  bool disableWeekends;
  bool disableWeekdays;
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

class ComponentComponent {
  String label;
  bool tableView;
  String ntsType;
  List<String> editableContext;
  List<String> viewableContext;
  List<String> viewableBy;
  List<String> editableBy;
  String key;
  String type;
  bool input;
  String columnMetadataId;
  bool autoExpand;

  ComponentComponent(
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
      this.columnMetadataId,
      this.autoExpand});

  ComponentComponent.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tableView = json['tableView'];
    ntsType = json['ntsType'];
    editableContext = json['editableContext'].cast<String>();
    viewableContext = json['viewableContext'].cast<String>();
    viewableBy = json['viewableBy'].cast<String>();
    editableBy = json['editableBy'].cast<String>();
    key = json['key'];
    type = json['type'];
    input = json['input'];
    columnMetadataId = json['columnMetadataId'];
    autoExpand = json['autoExpand'];
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
    data['columnMetadataId'] = this.columnMetadataId;
    data['autoExpand'] = this.autoExpand;
    return data;
  }
}
