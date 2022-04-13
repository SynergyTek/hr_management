import 'dart:convert';

class APIEndpointConstants {
  /// API Key to be used for accessing the API.
  static const String API_KEY = "2872b6179f2419aea44d59a61ef48f41";

  /// Base URL.
  static const BASE_URL = 'https://webapidev.aitalkx.com';

  static const PROFILE_PICTURE_ENDPOINT =
      BASE_URL + '/common/query/GetFile?fileId=';

  //************************************************************************//

  //Note API Endpoints Block Start

  //workboard comment
  static const POST_WORKBOARD_NOTE_COMMENT =
      BASE_URL + "/cms/Workboard/PostNoteComment";
  static const GET_WORKBOARD_NOTE_COMMENT =
      BASE_URL + "/cms/workboard/ReadNoteCommentDataList";

  static const POST_NOTE_COMMENT = '$BASE_URL/nts/command/PostNoteComment';

  static const GET_NOTE_COMMENT_DATA =
      '$BASE_URL/nts/query/GetNoteCommentCount';

  static const GET_NOTE_COMMENT_COUNT =
      '$BASE_URL/nts/query/GetTaskCommentCount';

  static const GET_NOTE_DETAILS = '$BASE_URL/nts/query/GetNoteDetails';

  static const MANAGE_NOTE = '$BASE_URL/nts/command/ManageNote';

  static const READ_NOTE_HOME_DATA = '$BASE_URL/nts/query/ReadNoteHomeData';

  static const GET_NOTE_CHART_BY_STATUS =
      '$BASE_URL/nts/query/GetNoteChartByStatus';

  static const GET_NOTE_CHART_BY_USERTYPE =
      '$BASE_URL/nts/query/GetNoteChartByUserType';

  static const READ_DATEWISE_NOTE_SLA =
      '$BASE_URL/nts/query/ReadDatewiseServiceSLA';

  static const READ_NOTE_DASHBOARD_DATA =
      '$BASE_URL/nts/query/ReadNoteDashBoardGridData';

  static const FILE_UPLOAD_ATTACHMENT = '$BASE_URL/CHR/query/UploadAttachment';

  //************************************************************************//

  //Task API Endpoints Block Start

  static const GET_TASK_HOME_DATA = '$BASE_URL/nts/query/ReadTaskHomeData';

  static const GET_TASK_DETAILS = '$BASE_URL/nts/query/GetTaskDetails';

  static const MANAGE_TASK = '$BASE_URL/nts/command/ManageTask';

  static const POST_TASK_COMMENT = '$BASE_URL/nts/command/PostTaskComment';

  static const GET_TASK_COMMENT_DATA =
      '$BASE_URL/nts/query/ReadTaskCommentData';

  static const GET_TASK_COMMENT_COUNT =
      '$BASE_URL/nts/query/GetTaskCommentCount';

  static const GET_TASK_CHART_BY_STATUS =
      '$BASE_URL/nts/query/GetTaskChartByStatus';

  static const GET_TASK_CHART_BY_USERTYPE =
      '$BASE_URL/nts/query/GetTaskChartByUserType';

  static const READ_DATEWISE_TASK_SLA =
      '$BASE_URL/nts/query/ReadDatewiseTaskSLA';

  static const READ_TASK_DASHBOARD_DATA =
      '$BASE_URL/nts/query/ReadTaskDashBoardGridData';

  static const READ_TASK_DATA_IN_PROGRESS =
      '$BASE_URL/nts/query/ReadTaskDataInProgress';

  static const READ_TASK_DATA_OVERDUE =
      '$BASE_URL/nts/query/ReadTaskDataOverdue';

  static const READ_TASK_DATA_COMPLETED =
      '$BASE_URL/nts/query/ReadTaskDataCompleted';

  static const READ_WORKBOARD_TASK_DATA =
      '$BASE_URL/cms/query/GetWorkboardTaskList';

  //Task API Endpoints Block End

  //************************************************************************//

  //Sevice API Endpoints Block Start

  static const MANAGE_LOGIN = '$BASE_URL/api/Authenticate/AuthenticateLogin';

  static const PORTAL_LIST_BY_EMAIL =
      '$BASE_URL/api/Authenticate/GetPortalListByEmail';

  static const GET_SERVICE_DETAILS = '$BASE_URL/nts/query/GetServiceDetails';

  static const LEAVE_DETAILS = '$BASE_URL/taa/query/leavedetail';
  static const BUSINESS_TRIP_DETAILS =
      '$BASE_URL/chr/leave/GetBusinessTripData';

  static const MANAGE_SERVICE = '$BASE_URL/nts/command/ManageService';

  static const POST_SERVICE_COMMENT =
      '$BASE_URL/nts/command/PostServiceComment';

  static const GET_SERVICE_COMMENT_DATA =
      '$BASE_URL/nts/query/ReadServiceCommentData';

  static const GET_SERVICE_COMMENT_COUNT =
      '$BASE_URL/nts/query/GetServiceCommentCount';

  static const GET_SERVICE_ATTACHMENT_COUNT =
      "$BASE_URL/cms/GetServiceAttachmentCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99";

  static const GET_SERVICE_CHART_BY_STATUS =
      '$BASE_URL/nts/query/GetServiceChartByStatus';

  static const GET_SERVICE_CHART_BY_USERTYPE =
      '$BASE_URL/nts/query/GetServiceChartByUserType';

  static const READ_DATEWISE_SERVICE_SLA =
      '$BASE_URL/nts/query/ReadDatewiseServiceSLA';

  static const READ_SERVICE_DASHBOARD_DATA =
      '$BASE_URL/nts/query/ReadServiceDashBoardGridData';

  static const GET_SERVICE_SHARED_COUNT =
      "http://95.111.235.64:446/cms/GetServiceSharedCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667588";

  static const GET_SERVICE_NOTIFICATION_COUNT =
      "http://95.111.235.64:446/cms/GetServiceNotificationCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99";

  static const GET_SERVICE_COMMENTS_COUNT =
      "http://95.111.235.64:446/cms/GetServiceCommentCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667589";

  static const READ_SERVICE_HOME_DATA =
      "$BASE_URL/nts/query/ReadServiceHomeData";

  //Service API Endpoints Block End

  //************************************************************************//

  static const GET_ALLOWED_TEMPLATES =
      '$BASE_URL/nts/query/GetAllowedTempaltes';
  // nts/query/GetAllowedTempaltes?categoryCode=STEP_TASK_CATEGORY&userid=45bba746-3309-49b7-9c03-b5793369d73c&templateType=Task&taskType=StepTask

  //************************************************************************//
  //Access Log API Endpoints Block Start

  static const String INSERT_ACCESS_LOG =
      '$BASE_URL/common/query/InsertAccessLog';

  static const GET_ACCESS_LOG_LIST_DATA = '$BASE_URL/taa/query/accessloglist';
  // ?startDate=2021-06-20 00:00:00.000&dueDate=2021-07-06 00:00:00.000&userId=cb9272df-0a2c-401b-aed8-b73488ae03aa';

  static const String GET_ATTENDANCE_VIEW_DATA =
      '$BASE_URL/taa/query/attendancelist?searchFromDate=2021-06-01 00:00:00.000&searchToDate=2021-07-30 00:00:00.000';

  //Access Log API Endpoints Block End
  //************************************************************************//

  //Worklist API Endpoints Block

  static const GET_TASK_TEMPLATE_TREE_LIST =
      '$BASE_URL/nts/query/GetTaskTemplateTreeList';

  static const GET_SERVICE_TEMPLATE_TREE_LIST =
      '$BASE_URL/nts/query/GetServiceTemplateTreeList';

  static const GET_NOTE_TEMPLATE_TREE_LIST =
      '$BASE_URL/nts/query/GetNoteTemplateTreeList';

  static const WORKLIST_DASHBOARD_COUNT =
      '$BASE_URL/nts/query/WorklistDashboardCount';

  static const WORKLIST_DASHBOARD_NOTE_COUNT =
      '$BASE_URL/nts/query/WorklistDashboardNoteSCount';

  static const WORKLIST_DASHBOARD_TREE_LIST_DATA =
      '$BASE_URL/nts/query/GetServiceTemplateTreeList';

  //Worklist API Endpoints Block End
  //************************************************************************//

  //Common API Endpoints Block

  static const GET_LOV_ID_NAME_LIST = '$BASE_URL/cms/query/GetLOVIdNameList';

  static const GET_ENUM_ID_NAME_LIST = '$BASE_URL/cms/query/GetEnumIdNameList';

  static const GET_OWNER_ID_NAME_LIST =
      '$BASE_URL/cms/query/GetOwnerIdNameList';

  static const GET_USER_ID_NAME_LIST = '$BASE_URL/cms/query/GetUserIdNameList';

  static const GET_ENUM_AS_TREE_LIST =
      '$BASE_URL/cms/query/GetEnumAsTreeList?id=Root';

  static const GET_MODULE_TREE_LIST =
      '$BASE_URL/cms/query/GetModuleTreeList?id=Root&portalName=HR';

  //Common API Endpoints Block End
  //************************************************************************//

  //Payroll Endpoints

  static const READ_PAYROLL_DATA = '$BASE_URL/CHR/query/ReadPayrollData';

  static const READ_PAYSLIP_DATA = '$BASE_URL/CHR/query/ReadPaySlipData';

  //Payroll API Endpoints Block End
  //************************************************************************//

  //USER/TEAMS/GROUP Endpoints

  static const READ_USER_DATA = '$BASE_URL/cms/user/ReadUserData';

  static const READ_TEAM_DATA = '$BASE_URL/cms/query/ReadTeamData';

  //User API Endpoints Block End
  //************************************************************************//

  //Employee profile Endpoints

  static const EMPLOYEE_PROFILE = '$BASE_URL/CHR/query/EmployeeProfile';

  //Employee profile API Endpoints Block End
  //************************************************************************//

  // Documents endpoints start here:

  static const GET_PERSON_DOCUMENTS_DATA =
      BASE_URL + '/CHR/query/ReadPersonDocumentRequestList';

  static const GET_PERSON_PROFILE_DATA =
      BASE_URL + '/CHR/query/EmployeeDocument';

  static const GET_NOTE_INDEX_PAGE_GRID_DATA =
      BASE_URL + '/CHR/query/LoadNoteIndexPageGrid';

  // Documents endpoints end here:

  //************************************************************************//

  // Dependent endpoints start here:

  static const READ_DEPENDENT_DOCUMENT_REQUEST_LIST =
      '$BASE_URL/CHR/query/ReadDependantDocumentRequestList';

  static const READ_DEPENDENT_LIST = '$BASE_URL/CHR/query/ReadDependantList';

  // Dependent API Endpoints Block End
  //************************************************************************//

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

  static const LOAD_SERVICE_ADHOC_TASK_DATA =
      '$BASE_URL/cms/query/LoadServiceAdhocTaskData';

  // Share API Endpoints Block End
  //************************************************************************//

  //************************************************************************//
  //Attachment API Endpoints

  static const GET_SERVICE_ATTACHMENT =
      BASE_URL + '/cms/query/GetServiceAttachmentList';

  static const GET_TASK_ATTACHMENT =
      BASE_URL + '/cms/query/GetTaskAttachmentList';

  static const GET_NOTE_ATTACHMENT =
      BASE_URL + '/cms/query/GetNoteAttachmentList';

  static const DELETE_NTS_ATTACHMENT = BASE_URL + '/cms/query/DeleteAttachment';

  //Attachment API Endpoints
  //************************************************************************//

  //************************************************************************//
  // Delete Comments

  static const String DELETE_NOTE_COMMENT_DATA =
      BASE_URL + '/cms/query/DeleteNoteComment';

  static const String DELETE_TASK_COMMENT_DATA =
      BASE_URL + '/cms/query/DeleteTaskComment';

  static const String DELETE_SERVICE_COMMENT_DATA =
      BASE_URL + '/cms/query/DeleteServiceComment';

  // Delete Comments
  //************************************************************************//

  //Tag API Endpoints

  static const READ_NTS_TAG_DATA = BASE_URL + '/cms/query/ReadNtsTagData';

  static const READ_TAG_CATEGORIES_WITH_TAG =
      BASE_URL + '/cms/query/ReadTagCategoriesWithTag';

  //Tag API Endpoints
  //************************************************************************//

  // Component Result API
  static const String GET_COMPONENT_RESULT_DATA =
      BASE_URL + '/cms/query/ReadComponentResultData';

  //************************************************************************//
  // Case management API:
  static const String GET_HELPDESK_REQUEST_RECEIVED =
      BASE_URL + '/tms/query/ReadHelpDeskRequestRecieved';

  static const String GET_HELPDESK_SLA_VIOLATION =
      BASE_URL + '/tms/query/ReadHelpeskSLAViolation';

  static const String GET_REQUEST_CHART_STATUS =
      BASE_URL + '/tms/query/GetRequestChartStatus';

  static const String GET_PENDING_TASK_COUNTS =
      BASE_URL + '/tms/query/ReadPendingTaskCounts';

  static const String GET_HELPDESK_BOX_1 =
      BASE_URL + '/tms/query/ReadHelpDeskBox1';

  static const String GET_HELPDESK_BOX_2 =
      BASE_URL + '/tms/query/ReadHelpDeskBox2';

  static const HELPDESK_DASHBOARD = BASE_URL + '/tms/query/HelpdeskDashboard';

  static const READ_HELP_DESK_REQUEST_CLOSED =
      BASE_URL + '/tms/query/ReadHelpDeskRequestClosed';

  //************************************************************************//
  // Case management API:

  //************************************************************************//
  // DMS API:

  static const GETDMSFILES = BASE_URL + '/dms/query/GetFiles';

  static const GET_DMS_ARCHIVE_NOTE_DATA = BASE_URL + '/dms/query/ArchiveNote';
  static const GET_DMS_COPY_NOTE_DATA = BASE_URL + '/dms/query/CopyNote';
  static const GET_DMS_CREATE_NOTE_DATA = BASE_URL + '/dms/query/';
  static const GET_DMS_DELETE_NOTE_DATA = BASE_URL + '/dms/query/DeleteNote';
  static const GET_DMS_MOVE_NOTE_DATA = BASE_URL + '/dms/query/MoveNote';
  static const GET_DMS_RENAME_NOTE_DATA = BASE_URL + '/dms/query/';

  static const POST_DMS_SEARCH_FILE_DATA = BASE_URL + '/dms/query/';

  static const POST_MANAGE_WORKSPACE_DATA =
      BASE_URL + '/api/command/ManageWorkspace';

  static const GET_CREATE_WORKSPACE_DATA =
      BASE_URL + '/api/command/CreateWorkspace';

  static const GET_WORKSPACE_DATA = BASE_URL + '/dms/query/ReadWorkspaceData';

  static const DELETE_WORKSPACE = BASE_URL + '/dms/query/DeleteWorkspace';

  static const POST_MANAGE_NEW_FOLDER_DATA =
      BASE_URL + '/api/command/ManageNewFolder';

  static const GET_CREATE_FOLDER_DATA = BASE_URL + '/api/command/CreateFolder';

  static const POST_MANAGE_UPLOADED_FILE_DATA = BASE_URL + '/dms/query/';

  static const GET_PARENT_WORKSPACE_ID_NAME_LIST_DATA =
      BASE_URL + '/dms/query/ReadParentWorkspaceIdNameList';

  static const GET_DOCUMENT_TEMPLATE_ID_NAME_LIST_BY_USER_DATA = BASE_URL +
      '/dms/query/GetDocumentTemplateIdNameListByUser?userId=45bba746-3309-49b7-9c03-b5793369d73c';

  static const GET_DOCUMENT_ARCHIVE_DATA =
      BASE_URL + '/dms/query/GetArchivedDocumentData';

  static const GET_BIN_DOCUMENT_DATA =
      BASE_URL + '/dms/query/GetBinDocumentData';

  static const GET_DOCUMENT_DATA = BASE_URL + '/dms/query/ReadDocumentData';

  static const GET_ALL_FOLDER_AND_DOCUMENT_DATA =
      BASE_URL + '/dms/query/GetAllFolderAndDocument';

  //************************************************************************//
  // DMS API:

  static const GET_ATTACHMENT_VIEW_WEBVIEW_URL =
      'https://webapidev.aitalkx.com/CHR/query/ViewAttachment?fileId=';

  static const GET_LEGAL_ENTITY_DATA =
      BASE_URL + '/cms/query/GetLegalEntityNameList';

  static const GET_SOURCE_FOLDERS = '$BASE_URL/dms/query/GetSourceFolders';

  //************************************************************************//
  //  DMS USER API Starts:

  static const GET_USERS_ID_NAME_LIST =
      '$BASE_URL/dms/query/GetUsersIdNameList';

  static const GET_USERS_GROUP_ID_NAME_LIST =
      '$BASE_URL/dms/query/GetUserGroupIdNameList';

  //************************************************************************//
  //  PERMISSION API Starts:

  static const GET_VIEW_PERMISSIONS_DATA =
      BASE_URL + '/dms/query/ViewPermission';

  static const GET_PERMISSIONS_DETAILS =
      BASE_URL + '/dms/query/GetPermissionDetails';

  static const DISABLE_PARENT_PERMISSIONS =
      BASE_URL + '/dms/query/DisableParentPermission';

  static const DELETE_PERMISSIONS = BASE_URL + '/dms/query/DeletePermission';

  static const SAVE_PERMISSIONS = BASE_URL + '/api/command/SavePermission';

  /// https://webapidev.aitalkx.com/cms/user/ReadUserPermissionData?userId=45bba746-3309-49b7-9c03-b5793369d73c&portalName=DMS
  /// Method: GET
  /// Params:
  ///   - userId
  ///   - portalName
  static const GET_READ_USER_PERMISSION_DATA_ENDPOINT =
      BASE_URL + '/cms/user/ReadUserPermissionData';
  //************************************************************************//
  // PERMISSION API Ends:

  // workboad api
  static const GET_WORKBOARD_DASHBOARD_LIST =
      BASE_URL + '/cms/workboard/GetWorkboardDashboardList';

  static const CREATE_WORKBOARD = BASE_URL + '/cms/workboard/CreateWorkboard';
  static const CHOOSE_TEMPLATE = BASE_URL + '/cms/workboard/ChooseTemplate';
  static const WORKBOARD_SORTING =
      'cms/query/GetLOVIdNameList?lovType=WORKBOARD_SORTING';
  static const WORKBOARD_STATUS =
      'cms/query/GetEnumIdNameList?enumType=WorkBoardstatusEnum';
  static const OPEN_CLOSE_WORKBOARD =
      BASE_URL + '/cms/workboard/OpenCloseWorkboard';
  static const MANAGE_WORKBOARD_DETAILS =
      BASE_URL + '/cms/workboard/ManageWorkBoardDetails';
  static const GET_DUPLICATE_WORKBOARD =
      BASE_URL + '/cms/workboard/DuplicateWorkboard';

  static const POST_DUPLICATE_WORKBOARD =
      BASE_URL + '/cms/workboard/PostDuplicateWorkboard';

  static const POST_MANAGE_WORKBOARD =
      BASE_URL + '/cms/workboard/ManageWorkBoard';
  static const GET_WORKBOARD_SECTION =
      BASE_URL + '/cms/workboard/WorkBoardSection';
  //?
  static const POST_MANAGE_WORKBOARD_SECTION =
      BASE_URL + '/cms/workboard/ManageWorkBoardSection';
  static const GET_ADD_WORKBOARD_CONTENT =
      BASE_URL + "/cms/workboard/AddWorkBoardContent";
  static const POST_WORKBOARD_CONTENT =
      BASE_URL + "/cms/workboard/ManageWorkBoardContent";
  static const GET_COPY_MOVE_ITEMS = BASE_URL + "/cms/workboard/CopyMoveItems";
  static const POST_MANAGE_ITEM_SHARING_COPY_MOVE =
      BASE_URL + "/cms/workboard/ManageItemSharing";
  static const POST_DUPLICATE_ITEM = BASE_URL + "/cms/workboard/DuplicateItems";
}
