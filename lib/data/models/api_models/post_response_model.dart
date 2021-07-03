class PostResponse {
  bool isSuccess;
  String item;
  String messages;

  PostResponse();

  PostResponse.fromJson(Map<String, dynamic> jsonResponse) {
    isSuccess = jsonResponse['IsSuccess'];
    // templateCode = jsonResponse['TemplateCode'];
    messages = jsonResponse['Messages']['Validate']!=null?jsonResponse['Messages']['Validate']:'';
  }

  PostResponse.withError(String errorValue)
      : item = null,
        messages = errorValue;
}
