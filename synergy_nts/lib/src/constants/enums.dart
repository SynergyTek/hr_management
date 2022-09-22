enum NTSType {
  service,
  task,
  note,
  workboard,
}

typedef OnTapPressedCallBack = void Function(
  dynamic key,
  dynamic key2,
  dynamic key3,
);

enum FilterType {
  module,
  status,
  role,
  owner,
  assignee,
  serviceOwnedRequested,
  requestType,
  requestStatus,
  serviceNo,
  date,
}

enum PortalType {
  cms,
  dms,
  hr,
  inventoryManagement,
  projectManagement,
}
