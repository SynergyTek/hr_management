import 'package:shared_preferences/shared_preferences.dart';

class APIEndpointConstants {
  /// API Key to be used for accessing the API.
  static const String API_KEY = "2872b6179f2419aea44d59a61ef48f41";

  /// Base URL.
  static const BASE_URL = 'https://webapidev.aitalkx.com';

  static const PROFILE_PICTURE_ENDPOINT =
      BASE_URL + '/common/query/GetFile?fileId=';

  //************************************************************************//

  //Note API Endpoints Block Start

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

  //Task API Endpoints Block End

  //************************************************************************//

  //Sevice API Endpoints Block Start

  static const MANAGE_LOGIN = '$BASE_URL/api/Authenticate/AuthenticateLogin';

  static const GET_SERVICE_DETAILS = '$BASE_URL/nts/query/GetServiceDetails';

  static const LEAVE_DETAILS = '$BASE_URL/taa/query/leavedetail';

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

  static const READ_PAYSLIP_DATA =
      '$BASE_URL/CHR/query/ReadPaySlipData?month=7&year=2021';

  //Payroll API Endpoints Block End
  //************************************************************************//

  //User Endpoints

  static const READ_USER_DATA = '$BASE_URL/cms/user/ReadUserData';

  //User API Endpoints Block End
  //************************************************************************//

  //User Endpoints

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

}

Future<String> getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userId = prefs.getString('id');
  return userId;
}
