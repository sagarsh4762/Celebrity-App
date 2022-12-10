// ignore_for_file: unused_local_variable, avoid_print

import 'package:http/http.dart' as http;

import '../model/celebrity.dart';

class CelebrityService {
  Future<List<Celebrity>> getDetails(String name) async {
    var client = http.Client();
    String url = 'https://api.api-ninjas.com/v1/celebrity?name=$name';
    var uri = Uri.parse(url);
    var response = await client.get(uri,
        headers: {'X-Api-Key': 'iDUVvgxEd+1cOB9P3IFrQg==78O8P14VFC5z1bt2'});
    print(response.body);
    var json = response.body;
    return celebrityFromJson(json);
  }
}
