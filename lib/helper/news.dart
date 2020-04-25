import 'dart:convert';

import 'package:vaw/model/Article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];
 Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a5b82157bc0841969626d90ceee0a552";
    var response = await http.get(url);
    
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        
          ArticleModel articleModel = ArticleModel( 
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'], 

          );
            news.add(articleModel);

       
      });
    }
    
 }

}