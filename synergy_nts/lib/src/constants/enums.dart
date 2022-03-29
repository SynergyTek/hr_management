enum NTSType {
  service,
  task,
  note,
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

Map<PortalType, String> portalTypeName = {
  PortalType.cms: 'CMS',
  PortalType.dms: 'DMS',
  PortalType.hr: 'HR',
  PortalType.inventoryManagement: 'InventoryManagement',
  PortalType.projectManagement: 'ProjectManagement',
};

Map<PortalType, String> portalTypeId = {
  PortalType.cms: 'af817f46-f64b-47f8-b632-caa267c5a575',
  PortalType.dms: '6ea64b17-6959-4cb8-a5d2-33728aebbbac',
  PortalType.hr: '8edc86b3-9934-46e3-95de-d76c816404b4',
  PortalType.inventoryManagement: '1985e68d-369f-4eef-9bf4-3356a1edd595',
  PortalType.projectManagement: '7a233584-d207-408e-a43b-0d7b67c6e5fd',
};
