import 'dart:convert';

import '../models/udf_models/birth_and_death_udf_json_model.dart';
import '../models/udf_models/grievance_udf_json_model.dart';
import '../models/udf_models/public_grievance_udf_json_model.dart';
import '../models/udf_models/sewerage_connection_udf_json_model.dart';
import '../models/udf_models/udf_json_model.dart';

//
class ParseJsonHelper {
  List<ColumnComponent> columnComponentList = [];
  List<FluffyComponent> fluffyComponentComList = [];
  List<PurpleComponent> purpleComponentList = [];
  var radioValue = {};

  // ! hardcoding UNDO
  // List<ColumnComponent> grievanceUDFs(udfJsonString) {
  //   if (udfJsonString != null) {
  //     udfJsonString = GrievanceUdfJson.fromJson(jsonDecode(udfJsonString));
  //     for (GrievanceUdfJsonComponent component in udfJsonString.components) {
  //       if (component.input == null) {
  //         continue;
  //       }

  //       if (component.title != null && component.title!.isNotEmpty) {
  //         ColumnComponent columnComponentLegend = ColumnComponent();
  //         columnComponentLegend.type = 'legend';
  //         columnComponentLegend.key = component.key;
  //         columnComponentLegend.label = component.title;
  //         columnComponentList.add(columnComponentLegend);
  //       }

  //       if ((component.title == null || component.title!.isEmpty) &&
  //           (component.legend != null && component.legend!.isNotEmpty)) {
  //         ColumnComponent columnComponentLegend = ColumnComponent();
  //         columnComponentLegend.type = 'legend';
  //         columnComponentLegend.key = component.key;
  //         columnComponentLegend.label = component.legend;
  //         columnComponentList.add(columnComponentLegend);
  //       }

  //       if (component.components != null && component.components!.isNotEmpty) {
  //         for (GrievancePurpleComponent componentComponent
  //             in component.components!) {
  //           if (componentComponent.components != null &&
  //               componentComponent.components!.isNotEmpty) {
  //             if ((componentComponent.legend != null &&
  //                 componentComponent.legend!.isNotEmpty)) {
  //               ColumnComponent columnComponentLegend = ColumnComponent();
  //               columnComponentLegend.type = 'legend';
  //               columnComponentLegend.key = componentComponent.key;
  //               columnComponentLegend.label = componentComponent.legend;
  //               columnComponentList.add(columnComponentLegend);
  //             }

  //             for (GrievanceFluffyComponent fluffyCom
  //                 in componentComponent.components!) {
  //               if (fluffyCom.columns != null &&
  //                   fluffyCom.columns!.isNotEmpty) {
  //                 for (Columns column in fluffyCom.columns!) {
  //                   for (ColumnComponent columnCom in column.components!) {
  //                     columnComponentList.add(columnCom);
  //                   }
  //                 }
  //               }
  //               if (fluffyCom.columnComponents != null &&
  //                   fluffyCom.columnComponents!.isNotEmpty) {
  //                 // IF loop added to identify and change the type of MAP from
  //                 // 'htmlelement' to 'map'
  //                 if (fluffyCom.key != null &&
  //                     fluffyCom.key!.isNotEmpty &&
  //                     (fluffyCom.key == 'map' ||
  //                         fluffyCom.key == 'Map' ||
  //                         fluffyCom.columnComponents!.first.chartItemName ==
  //                             "Map For Grievance-Map") &&
  //                     fluffyCom.columnComponents!.length == 1) {
  //                   ColumnComponent columnComponentMap =
  //                       fluffyCom.columnComponents!.first;
  //                   columnComponentMap.type = 'map';
  //                   columnComponentList.add(columnComponentMap);
  //                 } else {
  //                   for (ColumnComponent columnCom
  //                       in fluffyCom.columnComponents!) {
  //                     columnComponentList.add(columnCom);
  //                   }
  //                 }
  //               }
  //             }
  //           }
  //           if (componentComponent.columns != null &&
  //               componentComponent.columns!.isNotEmpty) {
  //             for (Columns column in componentComponent.columns!) {
  //               for (ColumnComponent columnCom in column.components!) {
  //                 columnComponentList.add(columnCom);
  //               }
  //             }
  //           }
  //           if (componentComponent.columnComponents != null &&
  //               componentComponent.columnComponents!.isNotEmpty) {
  //             // IF loop added to identify and change the type of MAP from
  //             // 'htmlelement' to 'map'
  //             if (componentComponent.key != null &&
  //                 componentComponent.key!.isNotEmpty &&
  //                 (componentComponent.key == 'map' ||
  //                     componentComponent.key == 'Map') &&
  //                 componentComponent.columnComponents!.length == 1) {
  //               ColumnComponent columnComponentMap =
  //                   componentComponent.columnComponents!.first;
  //               columnComponentMap.type = 'map';
  //               columnComponentList.add(columnComponentMap);
  //             } else {
  //               for (ColumnComponent columnCom
  //                   in componentComponent.columnComponents!) {
  //                 columnComponentList.add(columnCom);
  //               }
  //             }
  //           }
  //         }
  //       }

  //       if (component.columnComponents != null &&
  //           component.columnComponents!.isNotEmpty) {
  //         for (ColumnComponent columnCom in component.columnComponents!) {
  //           columnComponentList.add(columnCom);
  //         }
  //       }
  //     }
  //     for (ColumnComponent component in udfJsonString.columnComponents) {
  //       if (component.input == null) {
  //         continue;
  //       }

  //       columnComponentList.add(component);
  //     }
  //   }
  //   return columnComponentList;
  // }

  // List<ColumnComponent> parsePublicGrievanceUDFs(udfJsonString) {
  //   if (udfJsonString != null) {
  //     udfJsonString =
  //         PublicGrievanceUdfJson.fromJson(jsonDecode(udfJsonString));
  //     for (PublicGrievanceUdfJsonComponent component
  //         in udfJsonString.components) {
  //       if (component.title != null && component.title!.isNotEmpty) {
  //         ColumnComponent columnComponentLegend = ColumnComponent();
  //         columnComponentLegend.type = 'legend';
  //         columnComponentLegend.key = component.key;
  //         columnComponentLegend.label = component.title;
  //         columnComponentLegend.hidden = false;
  //         columnComponentList.add(columnComponentLegend);
  //       }
  //       if (component.components != null && component.components!.isNotEmpty) {
  //         for (PublicGrievanceComponentComponent componentComponent
  //             in component.components!) {
  //           if (componentComponent.columns != null &&
  //               componentComponent.columns!.isNotEmpty) {
  //             for (PublicGrievanceColumns column
  //                 in componentComponent.columns!) {
  //               for (ColumnComponent columnCom in column.components!) {
  //                 columnComponentList.add(columnCom);
  //               }
  //             }
  //           }
  //         }
  //       }
  //       if (component.columnComponents != null &&
  //           component.columnComponents!.isNotEmpty) {
  //         for (ColumnComponent componentComponent
  //             in component.columnComponents!) {
  //           columnComponentList.add(componentComponent);
  //         }
  //       }
  //     }
  //   }
  //   return columnComponentList;
  // }

  // List<ColumnComponent> parseBirthDeathRegistrationUDFs(udfJsonString) {
  //   if (udfJsonString != null) {
  //     udfJsonString = BirthDeathUdfJson.fromJson(jsonDecode(udfJsonString));
  //     for (BirthDeathUdfJsonComponent component in udfJsonString.components) {
  //       if ((component.legend != null && component.legend!.isNotEmpty)) {
  //         ColumnComponent columnComponentLegend = ColumnComponent();
  //         columnComponentLegend.type = 'legend';
  //         columnComponentLegend.key = component.key;
  //         columnComponentLegend.label = component.legend;
  //         columnComponentList.add(columnComponentLegend);
  //       }
  //       if (component.components != null && component.components!.isNotEmpty) {
  //         for (BirthDeathPurpleComponent componentComponent
  //             in component.components!) {
  //           if ((componentComponent.legend != null &&
  //               componentComponent.legend!.isNotEmpty)) {
  //             ColumnComponent columnComponentLegend = ColumnComponent();
  //             columnComponentLegend.type = 'legend';
  //             columnComponentLegend.key = componentComponent.key;
  //             columnComponentLegend.label = componentComponent.legend;
  //             columnComponentList.add(columnComponentLegend);
  //           }
  //           if (componentComponent.columns != null &&
  //               componentComponent.columns!.isNotEmpty) {
  //             for (Columns column in componentComponent.columns!) {
  //               for (ColumnComponent columnCom in column.components!) {
  //                 columnComponentList.add(columnCom);
  //               }
  //             }
  //           }
  //           if (componentComponent.components != null &&
  //               componentComponent.components!.isNotEmpty) {
  //             for (TentacledComponent tentacledComponent
  //                 in componentComponent.components!) {
  //               if (tentacledComponent.columns != null &&
  //                   tentacledComponent.columns!.isNotEmpty) {
  //                 for (Columns column in tentacledComponent.columns!) {
  //                   for (ColumnComponent columnCom in column.components!) {
  //                     columnComponentList.add(columnCom);
  //                   }
  //                 }
  //               } //TODO: TentacledComponent should ideally be within WHILE LOOP
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  //   return columnComponentList;
  // }

  // List<ColumnComponent> parseCommunityHallBookingUDFs(udfJsonString,
  //     Map<String, String> communityHallBookingConditionalValues) {
  //   Map<String, dynamic> udf = jsonDecode(udfJsonString);
  //   if (udfJsonString != null) {
  //     udfJsonString = UdfJson.fromJson(jsonDecode(udfJsonString));
  //     for (var i = 0; i < udf['components'].length; i++) {
  //       var outerComp = udf['components'][i];
  //       List<PurpleComponent> purpleComponentList = [];
  //       List<ColumnComponent> columnComponentList = [];
  //       if (outerComp['components'] == null && outerComp['columns'] != null) {
  //         outerComp['columns']!.forEach((element) {
  //           element['components'].forEach((inner) {
  //             columnComponentList.add(ColumnComponent.fromJson(inner));
  //           });
  //         });
  //       } else {
  //         if (outerComp['components'] == null) {
  //           continue;
  //         }
  //         outerComp['components'].forEach((element) {
  //           if (element['widget'] != null || element['input'] == true) {
  //             columnComponentList.add(ColumnComponent.fromJson(element));
  //           } else {
  //             purpleComponentList.add(PurpleComponent.fromJson(element));
  //           }
  //         });
  //       }
  //       udfJsonString.components[i].columnComponents = columnComponentList;
  //     }
  //   }
  //   if (udfJsonString != null) {
  //     for (UdfJsonComponent component in udfJsonString.components) {
  //       if (component.columnComponents != null &&
  //           component.columnComponents!.isNotEmpty) {
  //         for (ColumnComponent columnComponent in component.columnComponents!) {
  //           if (columnComponent.conditional == null) {
  //             columnComponentList.add(columnComponent);
  //           } else {
  //             if (communityHallBookingConditionalValues[
  //                     columnComponent.conditional!.when] ==
  //                 columnComponent.conditional!.eq) {
  //               columnComponentList.add(columnComponent);
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  //   return columnComponentList;
  // }

  // List<ColumnComponent> parseSewerageConnectionUDFs(
  //     udfJsonString, connectionForId) {
  //   if (udfJsonString != null) {
  //     udfJsonString =
  //         SewerageConnectionUdfJson.fromJson(jsonDecode(udfJsonString));
  //     for (SewerageConnectionUdfJsonComponent component
  //         in udfJsonString.components) {
  //       if ((component.title != null &&
  //           component.title!.isNotEmpty &&
  //           component.hidden != true)) {
  //         ColumnComponent columnComponentLegend = ColumnComponent();
  //         columnComponentLegend.type = 'legend';
  //         columnComponentLegend.key = component.key;
  //         columnComponentLegend.label = component.title;
  //         columnComponentList.add(columnComponentLegend);
  //       }
  //       if (component.components != null && component.components!.isNotEmpty) {
  //         for (ColumnComponent columnCom in component.components!) {
  //           if (columnCom.conditional != null &&
  //               columnCom.conditional!.eq == connectionForId &&
  //               columnCom.conditional!.show!) {
  //             columnComponentList.add(columnCom);
  //           } else if (columnCom.conditional != null &&
  //               columnCom.conditional!.eq != connectionForId &&
  //               !columnCom.conditional!.show!) {
  //             columnComponentList.add(columnCom);
  //           } else if (columnCom.conditional == null) {
  //             columnComponentList.add(columnCom);
  //           }
  //           if (columnCom.columns != null && columnCom.columns!.isNotEmpty) {
  //             for (Columns columns in columnCom.columns!) {
  //               if (columns.components != null &&
  //                   columns.components!.isNotEmpty) {
  //                 for (ColumnComponent columnComponent in columns.components!) {
  //                   if (columnComponent.columns != null &&
  //                       columnComponent.columns!.isNotEmpty) {
  //                     for (Columns columns in columnComponent.columns!) {
  //                       if (columns.components != null &&
  //                           columns.components!.isNotEmpty) {
  //                         for (ColumnComponent columnComponent
  //                             in columns.components!) {
  //                           if (columnComponent.conditional != null &&
  //                               columnComponent.conditional!.eq ==
  //                                   connectionForId &&
  //                               columnComponent.conditional!.show!) {
  //                             columnComponentList.add(columnCom);
  //                           } else if (columnComponent.conditional != null &&
  //                               columnComponent.conditional!.eq !=
  //                                   connectionForId &&
  //                               !columnComponent.conditional!.show!) {
  //                             columnComponentList.add(columnComponent);
  //                           } else if (columnComponent.conditional == null) {
  //                             columnComponentList.add(columnComponent);
  //                           }
  //                         }
  //                       }
  //                     }
  //                   } else {
  //                     if (columnComponent.conditional != null &&
  //                         columnComponent.conditional!.eq == connectionForId &&
  //                         columnComponent.conditional!.show!) {
  //                       columnComponentList.add(columnCom);
  //                     } else if (columnComponent.conditional != null &&
  //                         columnComponent.conditional!.eq != connectionForId &&
  //                         !columnComponent.conditional!.show!) {
  //                       columnComponentList.add(columnComponent);
  //                     } else if (columnComponent.conditional == null) {
  //                       columnComponentList.add(columnComponent);
  //                     }
  //                   }
  //                 }
  //               }
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  //   return columnComponentList;
  // }

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
