import 'dart:convert';
import 'package:dashboard/controller/side_bar_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:dashboard/model/articleModel.dart';
import 'package:flutter/material.dart';

class AnnoncePage extends StatelessWidget {
    
    @override
   AnnoncePage({super.key});
  
  Future<List<ModeleArticle>> fetchArticles() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/annonce/lire'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => ModeleArticle.fromJson(item)).toList();
    } else {
      throw Exception('Erreur lors du chargement des articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Get.put(SideBarController());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ModeleArticle>>(
              future: fetchArticles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erreur: ${snapshot.error}');
                } else {
                  return ArticleGridView(articles: snapshot.data!, sideBarController: sideBarController);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

const d_green = Color(0xFFF53F26);

class ArticleGridView extends StatelessWidget {
  final List<ModeleArticle> articles;
  final SideBarController sideBarController;

  ArticleGridView({required this.articles, required this.sideBarController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return GestureDetector(
            onTap: () {
              sideBarController.selectedArticle.value = article;
              sideBarController.index.value = 3;
            },
            child: Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.network(
                          "http://127.0.0.1${article.photo1}",
                          height: 205,
                          width: 240,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 100.0),
                          child: Text(
                            article.titre!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
