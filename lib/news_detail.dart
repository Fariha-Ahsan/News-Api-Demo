import 'package:flutter/material.dart';
import 'package:untitled2/news_model.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _size.height * .35,
                width: double.infinity,
                color: Colors.green,
                child: Image(
                  image: NetworkImage(article.urlToImage),
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(
                  article.title,
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: Text(
                  article.author,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: _size.height*.01,
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: _size.width*0.01),
                child: Text(article.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
