import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../main.dart';
import '../../../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Case Does Not Have Email/register_loading_page.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({super.key});

  static var userSettings = FirebaseAuth.instance.currentUser;

  // A global user object to easily extract data from other classes
  static user userData =
      user(firstName: '', email: '', credits: 0, completedLessons: [
    {0: false},
    {1: false},
    {2: false},
    {3: false},
    {4: false},
    {5: false},
    {6: false},
    {7: false},
    {8: false},
    {9: false},
    {10: false}
  ]);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final db = FirebaseFirestore.instance;
  bool isExtractionFinished = false;

  // acces data ig
  Future<void> extractUserData() async {
    String? docID = RegisterLoadingPage.userSettings?.uid;
    debugPrint(docID);
    // ignore: avoid_print
    print(LoadingScreen.userData.completedLessons);
    await db.collection("Users").doc(docID).get().then(
      (DocumentSnapshot doc) {
        debugPrint('Identified document...');
        final data = doc.data() as Map<String, dynamic>;
        debugPrint('Decoded and formatted data...');
        LoadingScreen.userData = user(
            firstName: data['name'],
            email: data['email'],
            credits: data['credits'],
            completedLessons: data['completedLessons']);
        isExtractionFinished = true;
      },
      onError: (e) => debugPrint("Error getting document: $e"),
    );
    debugPrint('All done! Booting up home screen...');

    // ignore: avoid_print
    print(LoadingScreen.userData.completedLessons[0]);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const EconMadeEasy()),
    );
  }

  @override
  void initState() {
    debugPrint("Initialized account accesing protocol");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint('Initialising user data extraction...');
      extractUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_outlined,
              size: 100.0,
            ),
            SizedBox(height: 30),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
