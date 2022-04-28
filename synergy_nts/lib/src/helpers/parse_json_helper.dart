import 'dart:convert';

import '../models/udf_models/udf_json_model.dart';

class ParseJsonHelper {
  List<ColumnComponent> columnComponentList = [];
  List<FluffyComponent> fluffyComponentComList = [];
  List<PurpleComponent> purpleComponentList = [];
  var radioValue = {};

  List<ColumnComponent> parseGenericUDFs(
      udfJsonString, Map<String, String> conditionalValues, serviceId) {
    List<ColumnComponent> conditionalComponents = [];
    Map<String, dynamic> udf = jsonDecode(udfJsonString);
    if (udfJsonString != null) {
      udfJsonString = UdfJson.fromJson(jsonDecode(udfJsonString));
      for (var i = 0; i < udf['components'].length; i++) {
        var outerComp = udf['components'][i];
        if (outerComp['components'] == null && outerComp['columns'] != null) {
          outerComp['columns']!.forEach((element) {
            element['components'].forEach((inner) {
              //Below conditions are added in accordance with the requirements of 'Meat Waste Clearance Form'
              if (inner['conditional'] == null) {
                columnComponentList.add(ColumnComponent.fromJson(inner));
              } else {
                if (conditionalValues[inner['conditional']['when']] ==
                    inner['conditional']['eq']) {
                  columnComponentList.add(ColumnComponent.fromJson(inner));
                } else if (serviceId != null && serviceId.isNotEmpty) {
                  conditionalComponents.add(ColumnComponent.fromJson(inner));
                }
              }
            });
          });
        } else {
          if (outerComp['label'] != null && outerComp['label'].isNotEmpty) {
            if (outerComp['conditional'] == null) {
              columnComponentList.add(ColumnComponent.fromJson(outerComp));
            } else {
              if (conditionalValues[outerComp['conditional']['when']] ==
                  outerComp['conditional']['eq']) {
                columnComponentList.add(ColumnComponent.fromJson(outerComp));
              } else if (serviceId != null && serviceId.isNotEmpty) {
                conditionalComponents.add(ColumnComponent.fromJson(outerComp));
              }
            }
          }
          if (outerComp['components'] == null) {
            continue;
          }
          outerComp['components'].forEach((element) {
            if (element['widget'] != null ||
                element['input'] == true ||
                (element['type'] == 'htmlelement' &&
                    element['key'] != "ApplyFor")) {
              columnComponentList.add(ColumnComponent.fromJson(element));
            } else {
              purpleComponentList.add(PurpleComponent.fromJson(element));
              if (element['columns'] != null && element['columns'].isNotEmpty) {
                element['columns']!.forEach((purpleElement) {
                  purpleElement['components'].forEach((inner) {
                    columnComponentList.add(ColumnComponent.fromJson(inner));
                  });
                });
              }
            }
          });
        }
        udfJsonString.components[i].columnComponents = columnComponentList;
        if (udfJsonString.components[i].legend != null &&
            udfJsonString.components[i].legend == outerComp['legend']) {
          udfJsonString.components[i].components = purpleComponentList;
        }
      }
    }
    if (udfJsonString != null) {
      for (UdfJsonComponent component in udfJsonString.components) {
        if ((component.legend != null && component.legend!.isNotEmpty) ||
            (component.title != null && component.title!.isNotEmpty)) {
          ColumnComponent columnComponentLegend = ColumnComponent();
          columnComponentLegend.type = 'legend';
          columnComponentLegend.key = component.key;
          columnComponentLegend.label = component.legend ?? component.title;
          columnComponentList.add(columnComponentLegend);
        }
        //To add the UDFs which doesn't depend on any condition
        if (component.conditional == null) {
          if (component.components != null &&
              component.components!.isNotEmpty) {
            for (PurpleComponent purpleComponent in component.components!) {
              if (purpleComponent.columns != null &&
                  purpleComponent.columns!.isNotEmpty) {
                for (Columns columns in purpleComponent.columns!) {
                  if (columns.components != null &&
                      columns.components!.isNotEmpty) {
                    for (ColumnComponent columnComponent
                        in columns.components!) {
                      if (columnComponent.columns != null &&
                          columnComponent.columns!.isNotEmpty) {
                        for (Columns columns in columnComponent.columns!) {
                          if (columns.components != null &&
                              columns.components!.isNotEmpty) {
                            for (ColumnComponent columnComponent
                                in columns.components!) {
                              columnComponentList.add(columnComponent);
                            }
                          }
                        }
                      } else {
                        columnComponentList.add(columnComponent);
                      }
                    }
                  }
                }
              }
              if (purpleComponent.components != null &&
                  purpleComponent.components!.isNotEmpty) {
                for (FluffyComponent fluffyComponent
                    in purpleComponent.components!) {
                  fluffyComponentComList.add(fluffyComponent);
                }
              }
            }
          } else if (udfJsonString.columnComponents != null &&
              udfJsonString.columnComponents!.isNotEmpty) {
            for (ColumnComponent columnComponent
                in udfJsonString.columnComponents!) {
              if (columnComponent.columns != null &&
                  columnComponent.columns!.isNotEmpty) {
                for (Columns columns in columnComponent.columns!) {
                  if (columns.components != null &&
                      columns.components!.isNotEmpty) {
                    for (ColumnComponent columnComponent
                        in columns.components!) {
                      columnComponentList.add(columnComponent);
                    }
                  }
                }
              } else {
                columnComponentList.add(columnComponent);
              }
            }
          }
          if (component.columnComponents != null &&
              component.columnComponents!.isNotEmpty) {
            for (ColumnComponent columnComponent
                in component.columnComponents!) {
              if (columnComponent.columns != null &&
                  columnComponent.columns!.isNotEmpty) {
                for (Columns columns in columnComponent.columns!) {
                  if (columns.components != null &&
                      columns.components!.isNotEmpty) {
                    for (ColumnComponent columnComponent
                        in columns.components!) {
                      columnComponentList.add(columnComponent);
                    }
                  }
                }
              } else {
                bool add = true;
                columnComponentList.forEach((element) {
                  if (element.key == columnComponent.key) add = false;
                });
                if (add) {
                  if (columnComponent.conditional != null) {
                    if (columnComponent.conditional!.eq ==
                            radioValue[columnComponent.conditional!.when] ||
                        columnComponent.conditional!.eq ==
                            columnComponent.defaultValue) {
                      columnComponentList.add(columnComponent);
                    } else if (serviceId != null && serviceId.isNotEmpty) {
                      conditionalComponents.add(columnComponent);
                    }
                  } else {
                    columnComponentList.add(columnComponent);
                  }
                }
              }
            }
          }
        } else {
          //To add the UDFs which are dependent on certain conditions
          if (component.components != null &&
              component.components!.isNotEmpty) {
            for (PurpleComponent purpleComponent in component.components!) {
              if (purpleComponent.columns != null &&
                  purpleComponent.columns!.isNotEmpty) {
                for (Columns columns in purpleComponent.columns!) {
                  if (columns.components != null &&
                      columns.components!.isNotEmpty) {
                    for (ColumnComponent columnComponent
                        in columns.components!) {
                      for (var element in columnComponentList) {
                        if (component.conditional!.when == element.key) {
                          if (columnComponent.columns != null &&
                              columnComponent.columns!.isNotEmpty) {
                            for (Columns columns in columnComponent.columns!) {
                              if (columns.components != null &&
                                  columns.components!.isNotEmpty) {
                                for (ColumnComponent columnComponent
                                    in columns.components!) {
                                  if (component.conditional!.eq ==
                                          radioValue[
                                              component.conditional!.when] ||
                                      component.conditional!.eq ==
                                          columnComponent.defaultValue) {
                                    columnComponentList.add(columnComponent);
                                  }
                                }
                              }
                            }
                          } else {
                            if (component.conditional!.eq ==
                                    radioValue[component.conditional!.when] ||
                                component.conditional!.eq ==
                                    columnComponent.defaultValue) {
                              columnComponentList.add(columnComponent);
                            }
                          }
                        }
                      }
                    }
                  }
                  if (purpleComponent.components != null &&
                      purpleComponent.components!.isNotEmpty) {
                    for (FluffyComponent fluffyComponent
                        in purpleComponent.components!) {
                      fluffyComponentComList.add(fluffyComponent);
                    }
                  }
                  break;
                }
              }
            }
          } else if (udfJsonString.columnComponents != null &&
              udfJsonString.columnComponents!.isNotEmpty) {
            for (ColumnComponent columnComponent
                in udfJsonString.columnComponents!) {
              for (var element in columnComponentList) {
                if (component.conditional!.when == element.key) {
                  if (columnComponent.columns != null &&
                      columnComponent.columns!.isNotEmpty) {
                    for (Columns columns in columnComponent.columns!) {
                      if (columns.components != null &&
                          columns.components!.isNotEmpty) {
                        for (ColumnComponent columnComponent
                            in columns.components!) {
                          if (component.conditional!.eq ==
                                  radioValue[component.conditional!.when] ||
                              component.conditional!.eq ==
                                  columnComponent.defaultValue) {
                            columnComponentList.add(columnComponent);
                          }
                        }
                      }
                    }
                  } else {
                    if (component.conditional!.eq ==
                            radioValue[component.conditional!.when] ||
                        component.conditional!.eq ==
                            columnComponent.defaultValue) {
                      columnComponentList.add(columnComponent);
                    }
                  }
                  break;
                }
              }
            }
          }
          if (component.columnComponents != null &&
              component.columnComponents!.isNotEmpty) {
            for (ColumnComponent columnComponent
                in component.columnComponents!) {
              for (var element in columnComponentList) {
                if (component.conditional!.when == element.key) {
                  if (columnComponent.columns != null &&
                      columnComponent.columns!.isNotEmpty) {
                    for (Columns columns in columnComponent.columns!) {
                      if (columns.components != null &&
                          columns.components!.isNotEmpty) {
                        for (ColumnComponent columnComponent
                            in columns.components!) {
                          if (component.conditional!.eq ==
                                  radioValue[component.conditional!.when] ||
                              component.conditional!.eq ==
                                  columnComponent.defaultValue) {
                            columnComponentList.add(columnComponent);
                          }
                        }
                      }
                    }
                  } else {
                    if (component.conditional!.eq ==
                            radioValue[component.conditional!.when]
                                .toString() ||
                        component.conditional!.eq ==
                            columnComponent.defaultValue) {
                      columnComponentList.add(columnComponent);
                    }
                  }
                  break;
                }
              }
            }
          }
        }
      }
    }

    //Below IF LOOP is added to add the conditional elements to the list
    //after verifying if the condition is met while VIEWing the service
    //Loop will not be executed while creating the new service
    List<ColumnComponent> interimCompList = [];
    if (serviceId != null && serviceId.isNotEmpty) {
      conditionalComponents.forEach((element) {
        columnComponentList.forEach((eachComponent) {
          if (eachComponent.key == element.conditional?.when &&
              eachComponent.udfValue == element.conditional?.eq) {
            var contains = interimCompList
                .where((interimElement) => interimElement.key == element.key);
            if (contains.isEmpty) {
              interimCompList.add(element);
            }
          }
        });
      });
    }

    if (interimCompList.isNotEmpty) {
      columnComponentList.addAll(interimCompList);
    }

    return columnComponentList;
  }
}
