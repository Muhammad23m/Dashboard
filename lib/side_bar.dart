import 'package:dashboard/controller/side_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const d_green = Color(0xFFF53F26);
const d_white = Color(0XFFF7C2C2);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Get.put(SideBarController());
    return Scaffold(
      body: Row(children: [
        Expanded(
          flex: 2,
          child: Container(
            color: d_green,
            child: Column(
              children: [
                Image.asset('assets/mylogo.png'),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Obx(
                      () => Scrollbar(
                        controller: _scrollController,
                        showTrackOnHover: false,
                        child: ListView(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(247, 201, 201, 201),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.home,
                                  color: Color.fromARGB(200, 255, 255, 255),
                                ),
                                title: Text('Accueil',
                                    style: TextStyle(color: Colors.white)),
                                onTap: () => sideBarController.index.value = 0,
                                selected: sideBarController.index.value == 0,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(247, 201, 201, 201),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.group,
                                  color: Colors.white,
                                ),
                                title: Text('Utilisateurs',
                                    style: TextStyle(color: Colors.white)),
                                onTap: () => sideBarController.index.value = 1,
                                selected: sideBarController.index.value == 1,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(247, 201, 201, 201),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.store,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'Annonces',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () => sideBarController.index.value = 2,
                                selected: sideBarController.index.value == 2,
                              ),
                            ),
                            SizedBox(
                              height: 140.0,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              title: Text('Déconnexion',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 100.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Rechercher...',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          top: 15.0,
                                          right: 10.0,
                                          bottom: 15.0,
                                          left: 10.0),
                                      suffixIcon: IconButton(
                                        // Utilisez suffixIcon pour placer l'icône à l'intérieur du TextField
                                        icon: Icon(Icons.search),
                                        onPressed: () {
                                          // Ajoutez votre logique de recherche ici
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 50.0, bottom: 20.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black26,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Mohamed Diarra',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Expanded(
                flex: 5,
                child: Obx(() => sideBarController.index.value <
                            sideBarController.pages.length
                        ? sideBarController.pages[sideBarController.index.value]
                        : Container() // Retourne un Container vide si l'index est hors de portée
                    ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

void main() {
  runApp(HomePage());
}
