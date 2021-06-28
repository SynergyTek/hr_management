class APIEndpointConstants {
  /// API Key to be used for accessing the API.
  static const String API_KEY = "2872b6179f2419aea44d59a61ef48f41";

  /// Base URL.
  static const BASE_URL = 'https://webapidev.aitalkx.com';

  // API Endpoints
  static const GET_MOVIES_URL = '$BASE_URL/nts/query/GetAllowedTempaltes';
  static const GET_READSERVICETEMPLATE_URL =
      '$BASE_URL/nts/query/GetAllowedTempaltes?categoryCode=Leave&userid=45bba746-3309-49b7-9c03-b5793369d73c%2052m%2019s';
  // '$BASE_URL/NtsService/ReadServiceTemplate?categoryCode=Leave';

  static const GET_SERVICE_DETAILS =
      'https://webapidev.aitalkx.com/nts/query/GetServiceDetails?templateCode=AnnualLeave&userid=45bba746-3309-49b7-9c03-b5793369d73c%2052m%2019s';
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
