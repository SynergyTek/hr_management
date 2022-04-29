// ignore_for_file: constant_identifier_names

class APIEndpointConstants {
  /// Base URL.
  static const BASE_URL = 'http://95.111.235.64:85';
  static const IMAGE_BASE_URL = 'https://synergydev.aitalkx.com';

  /// Portal ID:
  static const String EGOV_CUSTOMER_PORTAL_ID =
      "42999855-8942-4bc4-8715-fc67b9df718a";

  static const String EGOV_EMPLOYEE_PORTAL_ID =
      "79025ae1-fb4e-44c6-8157-cf5a4cd879ed";

  static const String EGOV_CUSTOMER_PORTAL_NAME = "EGovCustomer";

  static const String EGOV_EMPLOYEE_PORTAL_NAME = "EGovEmployee";

  // Common Repository:
  static const String GET_LOV_LIST_ENDPOINT =
      "$BASE_URL/EGOV/query/GetLOVIdNameList";

  static const String REQUEST_TYPE_ENDPOINT =
      "$BASE_URL/egov/query/ReadTemplateListByCategoryCodes";

  // Service Bloc/Repository:
  static const String LOAD_CUSTOM_SERVICE_INDEX_PAGE_DATA =
      "$BASE_URL/cms/query/LoadCustomServiceIndexPageGrid?templateId=c39dae94-83bf-4b37-8737-745c2b453e4d";

  static const String READ_SERVICE_HOME_DATA =
      "$BASE_URL/nts/query/ReadServiceHomeData";

  static const String GET_SERVICE_DETAILS =
      '$BASE_URL/nts/query/GetServiceDetails';

  static const String MANAGE_SERVICE = '$BASE_URL/nts/command/ManageService';

  static const String GET_MY_REQUEST_ENDPOINT =
      "$BASE_URL/egov/query/GetMyRequestList";

  static const GET_NOTE_ATTACHMENT =
      BASE_URL + '/cms/query/GetNoteAttachmentList';

  static const GET_TASK_ATTACHMENT =
      BASE_URL + '/cms/query/GetTaskAttachmentList';

  static const GET_SERVICE_ATTACHMENT =
      BASE_URL + '/cms/query/GetServiceAttachmentList';

  static const DELETE_NTS_ATTACHMENT = BASE_URL + '/cms/query/DeleteAttachment';

  static const FILE_UPLOAD_ATTACHMENT =
      '$BASE_URL/CHR/query/UploadNtsAttachment';

  // User repository:
  static const READ_USER_DATA = '$BASE_URL/cms/user/ReadUserData';

  static const READ_TEAM_DATA = '$BASE_URL/cms/query/ReadTeamData';

  static const READ_TEAM_USER_DATA = '$BASE_URL/cms/query/ReadUserTeamData';

  static const READ_HIERARCHY_DATA =
      '$BASE_URL/cms/query/ReadHierarchyMasterData';

  // task endpoints
  static const GET_TASK_HOME_DATA = '$BASE_URL/nts/query/ReadTaskHomeData';

  static const GET_TASK_DETAILS = '$BASE_URL/nts/query/GetTaskDetails';

  static const READ_TASK_DATA_IN_PROGRESS =
      '$BASE_URL/egov/query/ReadTaskDataInProgress';

  static const READ_TASK_DATA_OVERDUE =
      '$BASE_URL/egov/query/ReadTaskDataOverdue';

  static const READ_TASK_DATA_COMPLETED =
      '$BASE_URL/egov/query/ReadTaskDataCompleted';

  static const READ_TASK_DASHBOARD_DATA =
      '$BASE_URL/nts/query/ReadTaskDashBoardGridData';

  static const LOAD_SERVICE_ADHOC_TASK_DATA =
      '$BASE_URL/cms/query/LoadServiceAdhocTaskData';

  static const LOCK_TASK = '$BASE_URL/egov/query/LockTask';

  static const RELEASE_TASK = '$BASE_URL/egov/query/ReleaseTask';

  static const START_TASK = '$BASE_URL/egov/query/StartTask';

  static const MANAGE_TASK = '$BASE_URL/nts/command/ManageTask';

  static const DOWNLOAD_ATTACHMENT = '$BASE_URL/CHR/query/DownloadAttachment';

  static const GET_TASK_COMMENT_DATA =
      '$BASE_URL/nts/query/ReadTaskCommentData';

  static const POST_TASK_COMMENT = '$BASE_URL/nts/command/PostTaskComment';

  static const String DELETE_TASK_COMMENT_DATA =
      BASE_URL + '/cms/query/DeleteTaskComment';

// ........................................................... //
// Note Endpoints
// ........................................................... //

  static const GET_NOTE_DETAILS =
      'https://webapidev.aitalkx.com/nts/query/GetNoteDetails'; // TODO : replace base URL
  static const READ_NOTE_HOME_DATA = '$BASE_URL/nts/query/ReadNoteHomeData';
  static const READ_NOTE_DASHBOARD_DATA =
      '$BASE_URL/nts/query/ReadNoteDashBoardGridData';
  static const MANAGE_NOTE =
      'https://webapidev.aitalkx.com/nts/command/ManageNote';
  // static const MANAGE_NOTE = '$BASE_URL/nts/command/ManageNote';

  //
  static const GET_NOTE_CHART_BY_STATUS =
      '$BASE_URL/nts/query/GetNoteChartByStatus';

  static const GET_NOTE_CHART_BY_USERTYPE =
      '$BASE_URL/nts/query/GetNoteChartByUserType';

  static const READ_DATEWISE_NOTE_SLA =
      '$BASE_URL/nts/query/ReadDatewiseServiceSLA';

  // Share endpoints start here:
  static const GET_SERVICE_SHARED_DATA =
      '$BASE_URL/cms/query/ReadServiceSharedData';

  static const GET_TASK_SHARED_DATA = '$BASE_URL/cms/query/ReadTaskSharedData';

  static const GET_NOTE_SHARED_DATA = '$BASE_URL/cms/query/ReadNoteSharedData';

  static const DELETE_SERVICE_SHARED =
      '$BASE_URL/cms/query/DeleteServiceShared';

  static const DELETE_TASK_SHARED = '$BASE_URL/cms/query/DeleteNoteShared';

  static const DELETE_NOTE_SHARED = '$BASE_URL/cms/query/DeleteTaskShared';

  static const POST_SHARE_SERVICE = '$BASE_URL/cms/query/ShareService';

  static const POST_SHARE_TASK = '$BASE_URL/cms/query/ShareTask';

  static const POST_SHARE_NOTE = '$BASE_URL/cms/query/ShareNote';
}
