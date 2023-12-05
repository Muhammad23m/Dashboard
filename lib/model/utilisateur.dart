
class UtilisateurModel {
 final String? nom;
 final int contact;
 final String pseudo;
 final String motDePasse;
 final String? image;

  UtilisateurModel({
    this.nom,
    required this.contact,
    required this.pseudo,
    required this.motDePasse,
    this.image,
  });

  factory UtilisateurModel.fromJson(Map<String, dynamic> json) {
    return UtilisateurModel(
      nom: json['nom'],
      contact: json['contact'],
      pseudo: json['pseudo'],
      motDePasse: json['motDePasse'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'contact': contact,
      'pseudo': pseudo,
      'motDePasse': motDePasse,
      'image': image,
    };
  }

}
