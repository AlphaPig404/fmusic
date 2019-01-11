import 'dart:convert';
import 'dart:io';

class MyHttp{
  MyHttp(this.host, this.path, this.params);

  final String host;
  final path;
  final Map<String,String> params;

  get() async {
    var httpClient = new HttpClient();
    // Map<String, String> newParams = {}..addAll(params)..addAll(defaultParams); 
    var uri = new Uri.http(host, path, params);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseJson = await response.transform(utf8.decoder).join();

    return json.decode(responseJson);

    // return Disc.fromJson(responseMap);
  }
}








