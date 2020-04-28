import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vaw/views/category_news.dart';

class CatergoryTile extends StatelessWidget {
  final String imageUrl,categoryName;
  CatergoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          Navigator.push(context,  new MaterialPageRoute(builder: (context)=> CategoryNews(
            category: categoryName.toLowerCase(),
          )));
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