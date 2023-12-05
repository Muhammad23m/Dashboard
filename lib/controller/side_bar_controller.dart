import 'package:dashboard/accueil.dart';
import 'package:dashboard/annonce.dart';
import 'package:dashboard/articleDetailPage.dart';
import 'package:dashboard/model/articleModel.dart';
import 'package:dashboard/utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  RxInt index = 0.obs;
  Rx<ModeleArticle?> selectedArticle = Rx<ModeleArticle?>(null);
  List<Widget> pages = [];

  @override
  void onInit() {
    super.onInit();
    pages = [
      AccueilPage(),
      UtilisateurPage(),
      AnnoncePage(),
      Obx(() => ArticleDetailPage(article: selectedArticle.value)),
    ];
  }
}
