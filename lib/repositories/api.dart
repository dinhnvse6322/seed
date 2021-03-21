import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'file:///D:/SM9/SWD391/music_app/lib/repositories/sign_in_google.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "https://jsonplaceholder.typicode.com/photos";
  String serverUrl2 =
      "http://music-env.eba-9xc8in5w.ap-southeast-1.elasticbeanstalk.com";
  var status;
  var token;
  String accessToken;

  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    return json.decode(response.body);
  }

  Future<List> getActorData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    return json.decode(response.body);
  }

  Future<List<Map<String, dynamic>>> getAlbumData() async {
    String tokens = tokenId;
    String myUrl1 = "$serverUrl2/auths/verifytoken";
    String msg1 = jsonEncode({"token": "$tokens"});

    final response1 = await http.post(myUrl1,
        headers: {
          'Accept': 'application/json',
          "content-type": "application/json"
        },
        body: msg1);
    status = response1.body.contains('error');

    var data1 = json.decode(response1.body);
    accessToken = data1['data']['accessToken'];

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl2/albums/getall";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value',
      "content-type": "application/json",
      'x-access-token': '$accessToken'
    });

    return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  }

  Future<List<Map<String, dynamic>>> searchAlbumData(String search) async {
    String tokens = tokenId;
    String myUrl1 = "$serverUrl2/auths/verifytoken";
    String msg1 = jsonEncode({"token": "$tokens"});

    final response1 = await http.post(myUrl1,
        headers: {
          'Accept': 'application/json',
          "content-type": "application/json"
        },
        body: msg1);
    status = response1.body.contains('error');

    var data1 = json.decode(response1.body);
    accessToken = data1['data']['accessToken'];

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl2/albums/getall";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $value',
      "content-type": "application/json",
      'x-access-token': '$accessToken'
    });

    return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  }

  // Future<List> getAlbumData() async {
  //   String tokens = tokenId;
  //   String myUrl1 = "$serverUrl2/auths/verifytoken";
  //   String msg1 = jsonEncode({"token": "$tokens"});
  //
  //   final response1 = await http.post(myUrl1,
  //       headers: {'Accept': 'application/json', "content-type":"application/json"},
  //       body: msg1);
  //   status = response1.body.contains('error');
  //
  //   var data1 = json.decode(response1.body);
  //   accessToken = data1['data']['accessToken'];
  //
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key) ?? 0;
  //
  //   String myUrl = "$serverUrl2/albums/getall";
  //   http.Response response = await http.get(myUrl, headers: {
  //     'Accept': 'application/json',
  //     // 'Authorization': 'Bearer $value',
  //     "content-type":"application/json",
  //     'x-access-token': '$accessToken'
  //   });
  //   print('Response body : ${response.body}');
  //   return json.decode(response.body);
  // }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
