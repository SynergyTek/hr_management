class PostResponse {
  bool isSuccess;
  dynamic item;
  String messages;

  PostResponse();

  PostResponse.fromJson(Map<String, dynamic> jsonResponse) {
    isSuccess = jsonResponse['IsSuccess'];
    item = jsonResponse['Item'];
    // templateCode = jsonResponse['TemplateCode'];

    if (jsonResponse['Messages'] != null) {
      Map data = jsonResponse['Messages'];
      String key = data.keys.elementAt(0);

      messages = jsonResponse['IsSuccess'] == false
          ? jsonResponse['Messages']['Validate'] != null
              ? jsonResponse['Messages']['Validate']
              : jsonResponse['Messages'][key]
          : 'Item added Successfully';
    }
  }

  PostResponse.withError(String errorValue)
      : item = null,
        isSuccess = false,
        messages = errorValue;
}
