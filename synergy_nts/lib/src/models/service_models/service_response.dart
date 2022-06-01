import 'package:flutter/foundation.dart';

import 'service_model.dart';

class ServiceResponse {
  bool? isSuccess;
  bool? success;
  final Service? data;
  String? error;

  ServiceResponse({
    required this.data,
  });

  ServiceResponse.fromJson(Map<String, dynamic> response)
      : data = Service.fromJson(response),
        success = response["success"];

  ServiceResponse.withError(String? errorValue)
      : data = null,
        error = errorValue;
}

class ServiceListResponse {
  List<Service>? list;
  String? error;

  ServiceListResponse({
    required this.list,
  });

  ServiceListResponse.fromJson(List? response)
      : list = (response)?.map((i) => Service.fromJson(i)).toList();

  ServiceListResponse.withError(String? errorValue)
      : list = null,
        error = errorValue;
}

class StepTaskListResponseModel {
  final List<StepTasksList>? data;
  String? error;

  StepTaskListResponseModel({
    @required this.data,
  });

  StepTaskListResponseModel.fromJson(List response)
      : data = (response).map((i) => StepTasksList.fromJson(i)).toList();

  StepTaskListResponseModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}

// New
class PaginationDashboardTaskListResponse {
  PaginationDashboardTaskListModel? data;
  String? error;

  PaginationDashboardTaskListResponse({
    required this.data,
  });

  PaginationDashboardTaskListResponse.fromJson(Map<String, dynamic> response)
      : data = PaginationDashboardTaskListModel.fromJson(response);

  PaginationDashboardTaskListResponse.withError(String? errorValue)
      : data = null,
        error = errorValue;
}

class PaginationDashboardTaskListModel {
  int? totalCount;
  int? pageSize;
  int? currentPage;
  int? totalPages;
  String? previousPage;
  String? nextPage;
  List<StepTasksList>? items;

  PaginationDashboardTaskListModel({
    this.totalCount,
    this.pageSize,
    this.currentPage,
    this.totalPages,
    this.previousPage,
    this.nextPage,
    this.items,
  });

  PaginationDashboardTaskListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    previousPage = json['previousPage'];
    nextPage = json['nextPage'];
    if (json['items'] != null) {
      items = <StepTasksList>[];
      json['items'].forEach((v) {
        items!.add(StepTasksList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCount'] = totalCount;
    data['pageSize'] = pageSize;
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['previousPage'] = previousPage;
    data['nextPage'] = nextPage;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// New
class PaginationMyRequestsResponse {
  PaginationMyRequestsModel? data;
  String? error;

  PaginationMyRequestsResponse({
    required this.data,
  });

  PaginationMyRequestsResponse.fromJson(Map<String, dynamic> response)
      : data = PaginationMyRequestsModel.fromJson(response);

  PaginationMyRequestsResponse.withError(String? errorValue)
      : data = null,
        error = errorValue;
}

class PaginationMyRequestsModel {
  int? totalCount;
  int? pageSize;
  int? currentPage;
  int? totalPages;
  String? previousPage;
  String? nextPage;
  List<Service>? items;

  PaginationMyRequestsModel({
    this.totalCount,
    this.pageSize,
    this.currentPage,
    this.totalPages,
    this.previousPage,
    this.nextPage,
    this.items,
  });

  PaginationMyRequestsModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    previousPage = json['previousPage'];
    nextPage = json['nextPage'];
    if (json['items'] != null) {
      items = <Service>[];
      json['items'].forEach((v) {
        items!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCount'] = totalCount;
    data['pageSize'] = pageSize;
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['previousPage'] = previousPage;
    data['nextPage'] = nextPage;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
