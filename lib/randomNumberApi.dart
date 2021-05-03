import 'dart:convert';


import 'package:flutter_translation_app/RandomNumberObject.dart';

import 'package:dio/dio.dart';

const String numberEndpointServer = 'csrng.net';
const String endpointParam = '/csrng/csrng.php?min=1&max=1000';
const params = {"min": 1, "max": 1000};


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
     var response = await Dio().get('https://csrng.net/csrng/csrng.php', queryParameters: {'min':1, 'max': 1000}, );

        print(response.data);
    return RandomNumberObject.fromJson(jsonDecode('response'));
  } catch (e) {
    print(e);
  }


}
