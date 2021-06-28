class APIEndpointConstants {
  /// API Key to be used for accessing the API.
  static const String API_KEY = "2872b6179f2419aea44d59a61ef48f41";

  /// Base URL.
  static const BASE_URL = 'https://webapidev.aitalkx.com';

  // API Endpoints
  static const GET_MOVIES_URL = '$BASE_URL/nts/query/GetAllowedTempaltes';
  static const GET_READSERVICETEMPLATE_URL =
      '$BASE_URL/nts/query/GetAllowedTempaltes?categoryCode=Leave&userid=45bba746-3309-49b7-9c03-b5793369d73c';
  // '$BASE_URL/NtsService/ReadServiceTemplate?categoryCode=Leave';

  static const GET_SERVICE_DETAILS =
      'https://webapidev.aitalkx.com/nts/query/GetServiceDetails?templateCode=AnnualLeave&userid=45bba746-3309-49b7-9c03-b5793369d73c';

  static const MANAGE_SERVICE =
      'https://webapidev.aitalkx.com/nts/command/ManageService';
  static const String GET_SERVICE_ATTACHMENT_COUNT =
      "http://95.111.235.64:446/cms/GetServiceAttachmentCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99";

  static const String GET_SERVICE_SHARED_COUNT =
      "http://95.111.235.64:446/cms/GetServiceSharedCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667588";

  static const String GET_SERVICE_NOTIFICATION_COUNT =
      "http://95.111.235.64:446/cms/GetServiceNotificationCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99";

  static const String GET_SERVICE_COMMENTS_COUNT =
      "http://95.111.235.64:446/cms/GetServiceCommentCount?serviceId=a6262902-8516-48ca-b8b2-3e215e9e6b99&_=1624621667589";
}

// class APIEndpointConstants {
//   /// API Key to be used for accessing the API.
//   static const String API_KEY = "2872b6179f2419aea44d59a61ef48f41";

//   /// Base URL.
//   static const BASE_URL = 'http://95.111.235.64:446/cms';

//   // API Endpoints
//   static const GET_MOVIES_URL = '$BASE_URL/discover/movie';
//   static const GET_READSERVICETEMPLATE_URL =
//       '$BASE_URL/NtsService/ReadServiceTemplate?categoryCode=Leave';
// }
