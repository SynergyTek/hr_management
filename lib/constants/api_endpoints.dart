class APIEndpointConstants {
  /// API Key to be used for accessing the API.
  static const String API_KEY = "2872b6179f2419aea44d59a61ef48f41";

  /// Base URL.
  static const BASE_URL = 'https://webapidev.aitalkx.com';

  //************************************************************************//

  //Note API Endpoints Block Start

  //Note API Endpoints Block End

  //************************************************************************//

  //Task API Endpoints Block Start

  static const GET_TASK_HOME_DATA =
      '$BASE_URL/nts/query/ReadTaskHomeData?userid=45bba746-3309-49b7-9c03-b5793369d73c&';


  //Task API Endpoints Block End

  //************************************************************************//

  //Sevice API Endpoints Block Start

  static const GET_SERVICE_DETAILS =
      '$BASE_URL/nts/query/GetServiceDetails?templateCode=AnnualLeave&userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const MANAGE_SERVICE = '$BASE_URL/nts/command/ManageService';

  static const String GET_SERVICE_ATTACHMENT_COUNT =
      "$BASE_URL/cms/GetServiceAttachmentCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99";

  static const String GET_SERVICE_SHARED_COUNT =
      "http://95.111.235.64:446/cms/GetServiceSharedCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667588";

  static const String GET_SERVICE_NOTIFICATION_COUNT =
      "http://95.111.235.64:446/cms/GetServiceNotificationCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99";

  static const String GET_SERVICE_COMMENTS_COUNT =
      "http://95.111.235.64:446/cms/GetServiceCommentCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667589";

  //Service API Endpoints Block End

  //************************************************************************//

  static const GET_ALLOWED_TEMPLATES =
      '$BASE_URL/nts/query/GetAllowedTempaltes?categoryCode=Leave&userid=45bba746-3309-49b7-9c03-b5793369d73c';
  
  
  //************************************************************************//
  //Access Log API Endpoints Block Start

  static const String INSERT_ACCESS_LOG =
      '$BASE_URL/common/query/InsertAccessLog?userid=45bba746-3309-49b7-9c03-b5793369d73c&';
  // static String GET_REMOTE_ATTENDANCE_DATA = 'https://webapidev.aitalkx.com/common/query/InsertAccessLog?userid=45bba746-3309-49b7-9c03-b5793369d73c&punchingTime=Datetime.Now&punchingTye=0';

  //Access Log API Endpoints Block End
  //************************************************************************//
}

