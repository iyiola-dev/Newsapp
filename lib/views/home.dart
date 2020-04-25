import 'package:vaw/helper/data.dart';
import 'package:vaw/helper/news.dart';
import 'package:vaw/model/Article_model.dart';
import 'package:vaw/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                   padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              //Catergory
              Container(
               
                height: 70,
                child: ListView.builder(itemBuilder: (context, index){
                  return CatergoryTile(
                    imageUrl: category[index].imageUrl,
                    categoryName: category[index].categoryName,
                  );
                }, itemCount: category.length, shrinkWrap: true, scrollDirection: Axis.horizontal,),
              ),
              //Blogs
              Container(
                padding: const EdgeInsets.only(top:16),
                child: ListView.builder(itemBuilder: (context, index){
                  return BlogTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                  );
                },itemCount: articles.length, shrinkWrap: true,),
              )
            ],
          )
      ),
       ),
    );
  }
}
class CatergoryTile extends StatelessWidget {
  final imageUrl,categoryName;
  CatergoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
          child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect( borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl:imageUrl, width: 120, height: 60, fit: BoxFit.cover, )),
            Container(
              width: 120, height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              
              child: Text(categoryName, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  
  final String imageUrl, title, desc;
  BlogTile({@required this.imageUrl,@required  this.title,@required  this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text(title, style: TextStyle(
            fontSize: 17,
          ),),
          Text(desc)
        ],
      ),
    );
  }
}