import 'package:dashboard/model/utilisateur.dart';

class ModeleArticle {
  final String? titre;
  final int? prix;
  final String? description;
  final String? photo1;
  final String? etat;
  final UtilisateurModel? utilisateur; // Rendez l'utilisateur optionnel

  ModeleArticle({
     this.titre,
     this.prix,
     this.description,
     this.photo1,
     this.etat,
     this.utilisateur, // L'utilisateur est maintenant optionnel
  });

  factory ModeleArticle.fromJson(Map<String, dynamic> json) {
    return ModeleArticle(
      titre: json['titre'],
      prix: json['prix'],
      description: json['description'],
      photo1: json['photo1'],
      etat: json['etat'],
      utilisateur: json['utilisateur'] != null
          ? UtilisateurModel.fromJson(json['utilisateur'])
          : null, // Vérifiez si l'utilisateur est null avant de l'extraire
    );
  }
}
