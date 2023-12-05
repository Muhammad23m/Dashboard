import 'package:flutter/material.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 180.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 150, maxWidth: 250),
                  color: Color(0XFF1E78CB),
                  child: const Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "1270",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                              ),
                            ),
                            SizedBox(
                              width: 120.0,
                            ),
                            Icon(
                              Icons.group,
                              color: Colors.white,
                              size: 35.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            'Tous les Utilisateurs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 75.0,
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 150, maxWidth: 250),
                  color: Color(0XFF26CA71),
                  child: const Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "12",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                              ),
                            ),
                            SizedBox(
                              width: 145.0,
                            ),
                            Icon(
                              Icons.warning,
                              color: Colors.white,
                              size: 35.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            'Utilisateurs Signalés',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 150, maxWidth: 250),
                  color: Color.fromARGB(236, 161, 161, 161),
                  child: const Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "7",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                              ),
                            ),
                            SizedBox(
                              width: 155.0,
                            ),
                            Icon(
                              Icons.person_off,
                              color: Colors.white,
                              size: 35.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            'Utilisateurs Bloqués',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 75.0,
                ),
                Container(
                  constraints: BoxConstraints(maxHeight: 150, maxWidth: 250),
                  color: Color(0XFFFD9346),
                  child: const Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "120",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                              ),
                            ),
                            SizedBox(
                              width: 135.0,
                            ),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 35.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            'Nombre d\'articles vendus',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
