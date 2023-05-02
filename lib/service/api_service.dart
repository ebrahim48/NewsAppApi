import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapapi/model/news_model.dart';

class ApiService{
final all_news_url =

    "https://newsapi.org/v2/everything?q=bitcoin&apiKey=9c0e9b4c49e54e85a74972167b85f61e";

final breaking_news_url =

    "https://newsapi.org/v2/top-headlines?country=us&apiKey=9c0e9b4c49e54e85a74972167b85f61e";


Future<List<NewsModel>> getAllNews() async{
  try{
    Response response = await get(Uri.parse(all_news_url));
    if(response.statusCode == 200){
      Map<String,dynamic> json = jsonDecode(response.body);
      List<dynamic>body = json['articles'];
      List<NewsModel>articleslist = body.map((item) => NewsModel.fromJson(item)).toList();
      return articleslist;
    }else{
      throw("No news found");
    }

  }catch(e){
    throw e;
  }
}

Future<List<NewsModel>> getBreakingNews() async{
  try{
    Response response = await get(Uri.parse(breaking_news_url));
    if(response.statusCode == 200){
      Map<String,dynamic> json = jsonDecode(response.body);
      List<dynamic>body = json['articles'];
      List<NewsModel>articleslist = body.map((item) => NewsModel.fromJson(item)).toList();
      return articleslist;
    }else{
      throw("No news found");
    }

  }catch(e){
    print(e.toString());
    throw e;
  }
}

}