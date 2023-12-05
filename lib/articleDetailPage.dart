import 'package:dashboard/annonce.dart';
import 'package:dashboard/controller/side_bar_controller.dart';
import 'package:dashboard/model/articleModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ArticleDetailPage extends StatelessWidget {
  final ModeleArticle? article;

  ArticleDetailPage({this.article});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Get.put(SideBarController());
    return Scaffold(
      body: Center(
        child: Container(
          height: 620,
          width: 890,
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.white70,
            margin: EdgeInsets.all(50),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: d_green),
                        onPressed: () {
                          sideBarController.index.value = 2;
                          sideBarController.index.value = 2;
                        },
                      ),
                      Image.network("http://127.0.0.1/${article?.photo1}",
                          height: 250, width: 300),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        article!.titre!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      Text(
                        article!.prix.toString() + ' FCFA',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(article!.description!),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Etat :',
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 9.0,
                          ),
                          Text(article!.etat!),
                        ],
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
