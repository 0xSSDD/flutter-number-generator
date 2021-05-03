class RandomNumberObject {
  String input;
  String result;

  RandomNumberObject.fromJson(Map<String, dynamic> responseBody) {
    result = responseBody['random'];
  }


}