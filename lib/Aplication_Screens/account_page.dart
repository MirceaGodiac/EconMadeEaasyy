import 'package:econ_made_easy_files/Aplication_Screens/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1030,
      alignment: Alignment.center,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Icon(
              // the account icon at the top of the screen
              Icons.person,
              size: 100,
              color: Colors.blueGrey.shade400,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Nume si prenume: ${LoadingScreen.userData.firstName} ${LoadingScreen.userData.lastName}", // extract user data from the global class LoadingScreen and display
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 80),
            Row(
              // user info UI element
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
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut().then((res) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthPage()),
                  );
                });
                AuthPage.loggedIn = false;
                debugPrint(AuthPage.loggedIn.toString());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
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
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
