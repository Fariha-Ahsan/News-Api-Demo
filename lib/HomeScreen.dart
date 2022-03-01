import 'package:flutter/material.dart';
import 'package:untitled2/news_detail.dart';

import 'api_manager.dart';
import 'news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<NewsModel> _newsData;
  @override
  void initState() {
    // TODO: implement initState
    //print('init');
    _newsData=ApiManager().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),

      ),
      body: FutureBuilder<NewsModel>(
        future: _newsData,
        builder: (context, snapshot) {
          if(snapshot.hasData) {

            return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (context, index) {
                  var article=snapshot.data!.articles[index];

                  return Card(
                    child: GestureDetector(
                      onTap: (){
                        print(article.author);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetail(
                          article:article,
                        )
                        ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.lightBlueAccent,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            color: Colors.grey.withOpacity(0.5),
                            child: Image(
                              image: NetworkImage(article.urlToImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 100,
                            color: Colors.white,
                            child: ListTile(

                              title: Text(
                                article.title,
                                maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(article.author),
                            ),
                          ),
                        ],
                      ),
                      ),
                    ),
                  );
            }
            );
          }else{
            return CircularProgressIndicator();
          }
        },

      ),
    );
  }
}
