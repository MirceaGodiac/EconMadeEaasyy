import 'package:econ_made_easy_files/Aplication%20Screens/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'auth_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1030,
      alignment: Alignment.center,
      child: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 50,
            ),
            Icon(
              Icons.person,
              size: 100,
              color: Colors.blueGrey.shade400,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Nume si prenume: ${LoadingScreen.userData.firstName} ${LoadingScreen.userData.lastName}",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 80),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey.shade600,
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'nume de platforma: ',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        LoadingScreen.userData.userName,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100),
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.grey.shade600,
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'email: ',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        LoadingScreen.userData.email,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100),
                        child: Icon(
                          Icons.percent,
                          color: Colors.grey.shade600,
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lectii terminate',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Cat la suta din toate lectiile sunt terminate',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 27),
                  child: CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 5.0,
                    percent: 0.0,
                    center: const Text("0%"),
                    progressColor: Colors.green,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100),
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey.shade600,
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Scorul mediu',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Scorul mediu obtinut la fiecare test',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 27),
                  child: CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 5.0,
                    percent: 0.0,
                    center: const Text("0%"),
                    progressColor: Colors.green,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade100),
                        child: Icon(
                          Icons.auto_graph_sharp,
                          color: Colors.grey.shade600,
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Plasament',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Pe ce loc te afli printre toti utilizatorii dupa \n scorurile obtinute la quizuri',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 40),
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    )),
              ],
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut().then((res) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthPage()),
                  );
                });
                AuthPage.loggedIn = false;
                debugPrint(AuthPage.loggedIn.toString());
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 420),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue.shade200,
                ),
                child: Center(
                  child: Text(
                    'Iesire din cont',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade800),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
