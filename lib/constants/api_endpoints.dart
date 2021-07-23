class APIEndpointConstants {
  /// API Key to be used for accessing the API.
  static const String API_KEY = "2872b6179f2419aea44d59a61ef48f41";

  /// Base URL.
  static const BASE_URL = 'https://webapidev.aitalkx.com';

  //************************************************************************//

  //Note API Endpoints Block Start

  static const POST_NOTE_COMMENT = '$BASE_URL/nts/command/PostNoteComment';

  static const GET_NOTE_COMMENT_DATA =
      '$BASE_URL/nts/query/GetNoteCommentCount';

  static const GET_NOTE_COMMENT_COUNT =
      '$BASE_URL/nts/query/GetTaskCommentCount';

  static const GET_NOTE_DETAILS = '$BASE_URL/nts/query/GetNoteDetails';

  static const MANAGE_NOTE = '$BASE_URL/nts/command/ManageNote';

  static const READ_NOTE_HOME_DATA =
      '$BASE_URL/nts/query/ReadNoteHomeData?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const GET_NOTE_CHART_BY_STATUS =
      '$BASE_URL/nts/query/GetNoteChartByStatus?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const GET_NOTE_CHART_BY_USERTYPE =
      '$BASE_URL/nts/query/GetNoteChartByUserType?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_DATEWISE_NOTE_SLA =
      '$BASE_URL/nts/query/ReadDatewiseServiceSLA?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_NOTE_DASHBOARD_DATA =
      '$BASE_URL/nts/query/ReadNoteDashBoardGridData?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  //************************************************************************//

  //Task API Endpoints Block Start

  static const GET_TASK_HOME_DATA =
      '$BASE_URL/nts/query/ReadTaskHomeData?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const GET_TASK_DETAILS = '$BASE_URL/nts/query/GetTaskDetails';

  static const MANAGE_TASK = '$BASE_URL/nts/command/ManageTask';

  static const POST_TASK_COMMENT = '$BASE_URL/nts/command/PostTaskComment';

  static const GET_TASK_COMMENT_DATA =
      '$BASE_URL/nts/query/ReadTaskCommentData';

  static const GET_TASK_COMMENT_COUNT =
      '$BASE_URL/nts/query/GetTaskCommentCount';

  static const GET_TASK_CHART_BY_STATUS =
      '$BASE_URL/nts/query/GetTaskChartByStatus?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const GET_TASK_CHART_BY_USERTYPE =
      '$BASE_URL/nts/query/GetTaskChartByUserType?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_DATEWISE_TASK_SLA =
      '$BASE_URL/nts/query/ReadDatewiseTaskSLA?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_TASK_DASHBOARD_DATA =
      '$BASE_URL/nts/query/ReadTaskDashBoardGridData?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_TASK_DATA_IN_PROGRESS =
      '$BASE_URL/nts/query/ReadTaskDataInProgress?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_TASK_DATA_OVERDUE =
      '$BASE_URL/nts/query/ReadTaskDataOverdue?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_TASK_DATA_COMPLETED =
      '$BASE_URL/nts/query/ReadTaskDataCompleted?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  //Task API Endpoints Block End

  //************************************************************************//

  //Sevice API Endpoints Block Start

  static const MANAGE_LOGIN =
      'https://webapidev.aitalkx.com/api/Authenticate/login';

  static const GET_SERVICE_DETAILS = '$BASE_URL/nts/query/GetServiceDetails';

  static const LEAVE_DETAILS =
      '$BASE_URL/taa/query/leavedetail?userid=45bba746-3309-49b7-9c03-b5793369d73c';

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
      '$BASE_URL/nts/query/GetServiceChartByStatus?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const GET_SERVICE_CHART_BY_USERTYPE =
      '$BASE_URL/nts/query/GetServiceChartByUserType?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_DATEWISE_SERVICE_SLA =
      '$BASE_URL/nts/query/ReadDatewiseServiceSLA?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const READ_SERVICE_DASHBOARD_DATA =
      '$BASE_URL/nts/query/ReadServiceDashBoardGridData?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const GET_SERVICE_SHARED_COUNT =
      "http://95.111.235.64:446/cms/GetServiceSharedCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667588";

  static const GET_SERVICE_NOTIFICATION_COUNT =
      "http://95.111.235.64:446/cms/GetServiceNotificationCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99";

  static const GET_SERVICE_COMMENTS_COUNT =
      "http://95.111.235.64:446/cms/GetServiceCommentCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667589";

  static const READ_SERVICE_HOME_DATA =
      "$BASE_URL/nts/query/ReadServiceHomeData?userid=45bba746-3309-49b7-9c03-b5793369d73c";

  //Service API Endpoints Block End

  //************************************************************************//

  static const GET_ALLOWED_TEMPLATES =
      '$BASE_URL/nts/query/GetAllowedTempaltes?userid=45bba746-3309-49b7-9c03-b5793369d73c';
  // nts/query/GetAllowedTempaltes?categoryCode=STEP_TASK_CATEGORY&userid=45bba746-3309-49b7-9c03-b5793369d73c&templateType=Task&taskType=StepTask

  //************************************************************************//
  //Access Log API Endpoints Block Start

  static const String INSERT_ACCESS_LOG =
      '$BASE_URL/common/query/InsertAccessLog?userid=45bba746-3309-49b7-9c03-b5793369d73c&';

  static const GET_ACCESS_LOG_LIST_DATA =
      '$BASE_URL/taa/query/accessloglist?userid=45bba746-3309-49b7-9c03-b5793369d73c';
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
      '$BASE_URL/nts/query/WorklistDashboardCount?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const WORKLIST_DASHBOARD_NOTE_COUNT =
      '$BASE_URL/nts/query/WorklistDashboardNoteSCount?userid=45bba746-3309-49b7-9c03-b5793369d73c';

  //Worklist API Endpoints Block End
  //************************************************************************//

  //Common API Endpoints Block

  static const GET_LOV_ID_NAME_LIST = '$BASE_URL/cms/query/GetLOVIdNameList';

  static const GET_ENUM_ID_NAME_LIST = '$BASE_URL/cms/query/GetEnumIdNameList';

  static const GET_OWNER_ID_NAME_LIST =
      '$BASE_URL/cms/query/GetOwnerIdNameList?userId=45bba746-3309-49b7-9c03-b5793369d73c';

  static const GET_USER_ID_NAME_LIST = '$BASE_URL/cms/query/GetUserIdNameList';

  static const GET_ENUM_AS_TREE_LIST =
      '$BASE_URL/cms/query/GetEnumAsTreeList?id=Root';

  static const GET_MODULE_TREE_LIST =
      '$BASE_URL/cms/query/GetModuleTreeList?id=Root';

  //Common API Endpoints Block End
  //************************************************************************//

  //Payroll Endpoints

  static const READ_PAYROLL_DATA = '$BASE_URL/CHR/query/ReadPayrollData';
  static const READ_PAYSLIP_DATA =
      '$BASE_URL/CHR/query/ReadPaySlipData?month=7&year=2021&personId=45bba746-3309-49b7-9c03-b5793369d73c';
}
