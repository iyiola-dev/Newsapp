import 'package:vaw/helper/data.dart';
import 'package:vaw/helper/news.dart';
import 'package:vaw/model/Article_model.dart';
import 'package:vaw/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:vaw/view/blogtile.dart';
import 'package:vaw/view/catergorytile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState(){
    super.initState(); 
    category =  getCategories();
    getNews();
  }
  getNews() async{
    News newsClass =News();
    await newsClass.getNews();
    articles =newsClass.news;
    setState(() {
      _loading = false;
    });
  }
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
      ) :
       SingleChildScrollView(
                child: Container(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              //Catergory
              Container(
                height: 70,
                child: ListView.builder(itemBuilder: (context, index,){
                  return CatergoryTile(
                    imageUrl: category[index].imageUrl,
                    categoryName: category[index].categoryName,
                  );
                }, itemCount: category.length, shrinkWrap: true, scrollDirection: Axis.horizontal,),
              ),
              //Blogs
              Container(
                  child: ListView.builder(itemBuilder: (context, index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      url: articles[index].url,
                      title: articles[index].title,
                      desc: articles[index].description, 
                    );
                  },itemCount: articles.length, shrinkWrap: true, physics: ClampingScrollPhysics(),),
                )
            ],
          )
      ),
       ),
    );
  }
}


