import 'dart:convert';


import 'package:flutter_translation_app/RandomNumberObject.dart';

import 'package:dio/dio.dart';

const String numberEndpointServer = 'csrng.net';
const String endpointParam = '/csrng/csrng.php?min=1&max=1000';
const params = {"min": 1, "max": 1000};

// Future<TranslationObject> fetchTranslation(String inputText, {String language = 'et'}) async {
//   Response response = await http.post(Uri.https(endpointServer, endpointParam),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(<String, String>{
//         'text': inputText,
//         'tgt': language,
//         'domain': "inf"
//       }));
//   print(response.body);
//   return TranslationObject.fromJson(jsonDecode(response.body));
// c}
// final response = await http.get(
// Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
// headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
// );
// final responseJson = jsonDecode(response.body);
//
// return Album.fromJson(responseJson);

Future<RandomNumberObject> fetchRandomNumber() async {
  print('why');
  // https://csrng.net/csrng/csrng.php?min=1&max=100
  // Response response = await http.get(Uri.https(numberEndpointServer, endpointParam),
  //     // headers: <String, String>{
  //     //   'Content-Type': 'application/json',
  //     // });
  // );
  
    // return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
  // Response response = await http.get(Uri.https('csrng.net', 'csrng/csrng.php', params));
  //
  //  print('response body lmao'+ response.body);
  // return RandomNumberObject.fromJson(jsonDecode(response.body));
  try {
    var response = await Dio().get('https://csrng.net/csrng/csrng.php', queryParameters: {'min':1, 'max': 1000});
        print(response.data);
  } catch (e) {
    print(e);
  }

}
