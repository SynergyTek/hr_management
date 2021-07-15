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

  //Note API Endpoints Block End

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

  static const GET_SERVICE_SHARED_COUNT =
      "http://95.111.235.64:446/cms/GetServiceSharedCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667588";

  static const GET_SERVICE_NOTIFICATION_COUNT =
      "http://95.111.235.64:446/cms/GetServiceNotificationCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99";

  static const GET_SERVICE_COMMENTS_COUNT =
      "http://95.111.235.64:446/cms/GetServiceCommentCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667589";

  //Service API Endpoints Block End

  //************************************************************************//

  static const GET_ALLOWED_TEMPLATES =
      '$BASE_URL/nts/query/GetAllowedTempaltes?userid=45bba746-3309-49b7-9c03-b5793369d73c';
  // nts/query/GetAllowedTempaltes?categoryCode=STEP_TASK_CATEGORY&userid=45bba746-3309-49b7-9c03-b5793369d73c&templateType=Task&taskType=StepTask

  //************************************************************************//
  //Access Log API Endpoints Block Start

  static const String INSERT_ACCESS_LOG =
      '$BASE_URL/common/query/InsertAccessLog?userid=45bba746-3309-49b7-9c03-b5793369d73c&';
  // static String GET_REMOTE_ATTENDANCE_DATA = 'https://webapidev.aitalkx.com/common/query/InsertAccessLog?userid=45bba746-3309-49b7-9c03-b5793369d73c&punchingTime=Datetime.Now&punchingTye=0';

  static const GET_ACCESS_LOG_LIST_DATA =
      '$BASE_URL/taa/query/accessloglist?userid=45bba746-3309-49b7-9c03-b5793369d73c';
  // ?startDate=2021-06-20 00:00:00.000&dueDate=2021-07-06 00:00:00.000&userId=cb9272df-0a2c-401b-aed8-b73488ae03aa';

  static const String GET_ATTENDANCE_VIEW_DATA =
      '$BASE_URL/taa/query/attendancelist?searchFromDate=2021-06-01 00:00:00.000&searchToDate=2021-07-30 00:00:00.000';
  // '$BASE_URL/taa/query/attendancelist?userId=1721be46-402a-412a-b3c9-e176f32e3536&searchFromDate=2021-06-01 00:00:00.000&searchToDate=2021-07-30 00:00:00.000';

  //Access Log API Endpoints Block End
  //************************************************************************//

}
