class PostResponse {
  bool isSuccess;
  String item;
  String messages;

  PostResponse();

  PostResponse.fromJson(Map<String, dynamic> jsonResponse) {
    isSuccess = jsonResponse['IsSuccess'];
    // templateCode = jsonResponse['TemplateCode'];
    messages = jsonResponse['IsSuccess'] == false
        ? jsonResponse['Messages']['Validate'] != null
            ? jsonResponse['Messages']['Validate']
            : ''
        : 'Leave Applied Successfully';
  }

  PostResponse.withError(String errorValue)
      : item = null,
        messages = errorValue;
}
