import 'dart:convert';
import 'dart:io';

import 'bean/WangkResponse.dart';

class Utils {
  ///请求方法
  Future<String> requestPost(String path,
      [Map<String, String> queryParameters]) async {
    print('Utils.query--> '+json.encode(queryParameters));
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

///
///
/// List list = json.decode(result)['data'];
WangkResponse handleResp(String resp) {
  WangkResponse wangkResponse = WangkResponse();
  wangkResponse.status = 401;
  wangkResponse.message = "请求失败，请稍后重试！";
  try {
    var jsonWangk = json.decode(resp);
    wangkResponse.status = jsonWangk['status'];
    wangkResponse.message = jsonWangk['message'];
    wangkResponse.data = jsonWangk['data'];
    return wangkResponse;
  } catch (e) {
    print('解析异常');
    return wangkResponse;
  }
}
