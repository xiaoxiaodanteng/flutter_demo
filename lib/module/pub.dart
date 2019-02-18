import 'package:dio/dio.dart';
import 'package:toutiao/module/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PubModule {
  static httpRequest(method,url,[data]) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio().options.headers['Authorization'] = prefs.getString('token') ?? '';
    try {
      Response response;
      switch (method) {
        case 'get':
          response =  await Dio().get(Config.apiUrl + url);
          break;
        case 'post':
          response =  await Dio().post(Config.apiUrl + url, data:data);
          break;
        default:
      }
      return response;
    } catch (e) {
      print(e);
    }
  }

  static checkUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}