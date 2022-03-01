import 'dart:convert';

import 'package:http/http.dart' as http;

import 'news_model.dart';

class ApiManager{
  Future<NewsModel> getData() async{
  var client = http.Client();
  var model=null;
  try {
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=63a11b3ce18e4af6994da8f37b1fd270');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      model = NewsModel.fromJson(jsonMap);
    }
  }catch(Exception){
    return model;
  }
  return model;
  }
}