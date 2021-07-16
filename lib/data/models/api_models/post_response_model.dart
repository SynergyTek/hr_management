class PostResponse {
  bool isSuccess;
  dynamic item;
  String messages;

  PostResponse();

  PostResponse.fromJson(Map<String, dynamic> jsonResponse) {
    isSuccess = jsonResponse['IsSuccess'];
    item= jsonResponse['Item'];
    // templateCode = jsonResponse['TemplateCode'];
    messages = jsonResponse['IsSuccess'] == false
        ? jsonResponse['Messages']['Validate'] != null
            ? jsonResponse['Messages']['Validate']
            : ''
        : 'Leave Applied Successfully';
  }

  PostResponse.withError(String errorValue)
      : item = null,
        isSuccess = false,
        messages = errorValue;
}
