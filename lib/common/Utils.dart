import 'dart:convert';
import 'dart:io';

class Utils {
  /**
   * 请求方法
   */
  Future<String> requestPost(String path,
      [Map<String, String> queryParameters]) async {

    var httpClient = new HttpClient();

    // ignore: close_sinks
    var uri = new Uri.http("47.105.168.20", path, queryParameters);
    var request = await httpClient.postUrl(uri);
    var response = await request.close();
    var resp = await response.transform(utf8.decoder).join();
    //打印
    print('Utils.resp--> ' + resp);
    //关闭
    httpClient.close();

    return resp;
  }
}
