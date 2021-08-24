class TagCategoryViewModel {
  String tagCategoryType;
  String tagCategoryCode;
  String tagCategoryName;
  String enableAutoTag;
  String tagSourceId;
  String textQueryCode;
  String textQueryFilter;
  String ntsType;
  String ntsId;
  String tagId;
  String tagCategoryId;
  String tagName;
  String name;
  String createdByName;
  String lastUpdatedByName;
  List<TagCategoryViewModel> tags;
  bool hasChildren;

  TagCategoryViewModel({
    this.tagCategoryType,
    this.tagCategoryCode,
    this.tagCategoryName,
    this.enableAutoTag,
    this.tagSourceId,
    this.textQueryCode,
    this.textQueryFilter,
    this.ntsType,
    this.ntsId,
    this.tagId,
    this.tagCategoryId,
    this.tagName,
    this.name,
    this.createdByName,
    this.lastUpdatedByName,
    this.tags,
    this.hasChildren,
  });

  TagCategoryViewModel.fromJson(Map<String, dynamic> json) {
    tagCategoryType = json['TagCategoryType'];
    tagCategoryCode = json['TagCategoryCode'];
    tagCategoryName = json['TagCategoryName'];
    enableAutoTag = json['EnableAutoTag'];
    tagSourceId = json['TagSourceId'];
    textQueryCode = json['TextQueryCode'];
    textQueryFilter = json['TextQueryFilter'];
    ntsType = json['NtsType'];
    ntsId = json['NtsId'];
    tagId = json['TagId'];
    tagCategoryId = json['TagCategoryId'];
    tagName = json['TagName'];
    name = json['Name'];
    createdByName = json['CreatedByName'];
    lastUpdatedByName = json['LastUpdatedByName'];
    tags = json['Tags'];
    hasChildren = json['HasChildren'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TagCategoryType'] = this.tagCategoryType;
    data['TagCategoryCode'] = this.tagCategoryCode;
    data['TagCategoryName'] = this.tagCategoryName;
    data['EnableAutoTag'] = this.enableAutoTag;
    data['TagSourceId'] = this.tagSourceId;
    data['TextQueryCode'] = this.textQueryCode;
    data['TextQueryFilter'] = this.textQueryFilter;
    data['NtsType'] = this.ntsType;
    data['NtsId'] = this.ntsId;
    data['TagId'] = this.ntsId;
    data['TagCategoryId'] = this.tagCategoryId;
    data['TagName'] = this.tagName;
    data['Name ;     '] = this.name;
    data['CreatedByName'] = this.createdByName;
    data['LastUpdatedByName'] = this.lastUpdatedByName;
    data['Tags'] = this.tags;
    data['HasChildren'] = this.hasChildren;
    return data;
  }
}
