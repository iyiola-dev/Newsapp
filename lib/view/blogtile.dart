
import 'package:flutter/material.dart';
import 'package:vaw/views/article_view.dart';

class BlogTile extends StatelessWidget {
  
  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl,@required  this.title,@required  this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => ArticleView(
          blogUrl: url
        ) ));
      },
      child: Container(padding: EdgeInsets.only(top: 22),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(imageUrl)),
                  Text(title, style: TextStyle(
              fontSize: 17,
              color: Colors.black87,
              fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 6,),
                  Text(desc, style: TextStyle(
            color: Colors.grey,
                  ),) 
                ],
              ),
            ),
         
    );
  }
}