import 'dart:convert';
import 'package:dashboard/model/utilisateur.dart';
import 'package:dashboard/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UtilisateurPage extends StatelessWidget {
  const UtilisateurPage({super.key});

  Future<List<UtilisateurModel>> fetchUtilisateurs() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/utilisateur/read'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((item) => UtilisateurModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Erreur lors du chargement des articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: FutureBuilder<List<UtilisateurModel>>(
            future: fetchUtilisateurs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur: ${snapshot.error}');
              } else {
                return UtilisateurGridView(utilisateurs: snapshot.data!);
              }
            },
          ),
        ),
      ],
    ));
  }
}

class UtilisateurGridView extends StatelessWidget {
  final List<UtilisateurModel> utilisateurs;

  UtilisateurGridView({required this.utilisateurs});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: utilisateurs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Nombre de colonnes
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final utilisateur = utilisateurs[index];
        return Padding(
          padding: EdgeInsets.all(25.0),
          child: Container(
            width: 150,
            height: 150,
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: utilisateur.image != null &&
                                utilisateur.image!.isNotEmpty
                            ? CircleAvatar(
                                radius:
                                    30, // Ajustez la taille comme vous le souhaitez
                                backgroundImage:
                                    NetworkImage(utilisateur.image!),
                              )
                            : CircleAvatar(
                                radius:
                                    30, // Ajustez la taille comme vous le souhaitez
                                backgroundColor: d_green,
                                child: Text(
                                  utilisateur.nom != null &&
                                          utilisateur.nom!.isNotEmpty
                                      ? utilisateur.nom![0].toUpperCase()
                                      : '', // Prend la première lettre du nom et la met en majuscule
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                              ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton<String>(
                          tooltip: null,
                          onSelected: (value) {
                            // Gérez les actions du menu ici
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'bloquer',
                              child: Text('Bloquer'),
                            ),
                            PopupMenuItem(
                              value: 'annonces',
                              child: Text('Voir les annonces'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    utilisateur.nom!,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(utilisateur.contact.toString()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
