class APIEndpointConstants {
  /// API Key to be used for accessing the API.
  static const String API_KEY = "2872b6179f2419aea44d59a61ef48f41";

  /// Base URL.
  static const BASE_URL = 'http://95.111.235.64:446/cms';

  // API Endpoints
  static const GET_MOVIES_URL = '$BASE_URL/discover/movie';
  static const GET_READSERVICETEMPLATE_URL =
      '$BASE_URL/NtsService/ReadServiceTemplate?categoryCode=Leave';
}
