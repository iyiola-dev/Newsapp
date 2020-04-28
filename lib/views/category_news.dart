import 'package:flutter/material.dart';
import 'package:vaw/helper/news.dart';
import 'package:vaw/model/Article_model.dart';
import 'package:vaw/view/blogtile.dart';

class CategoryNews extends StatefulWidget {
  final category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsClass =CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles =newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Track"),
            Text("News" , style: TextStyle(color: Colors.blue),)
          ],
        ),
      ),
      body: _loading ? Center(
        child: Container(
            child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
              child: Container(
          child: Column(
            children: <Widget>[
               Container(
                    height: 1200,
                      padding: const EdgeInsets.only(top:16),
                      child: ListView.builder(itemBuilder: (context, index){
                        return BlogTile(
                          url: articles[index].url,
                          title: articles[index].title,
                          desc: articles[index].description, imageUrl: articles[index].urlToImage, 
                        );
                      },itemCount: articles.length, shrinkWrap: true, physics: ClampingScrollPhysics(),),
                    )
                ],
              ),
        ),
      )
      );
  }
}