import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Other stuff/lessons_list.dart';
import '../main.dart';
import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({super.key});

  static String documentID = '';
  static user userData = user(
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      credits: 0,
      completedLessons: [
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
  final userSettings = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;

  bool isExtractionFinished = false;

  // create a list of document ID's

  List<String> docIDs = [];

  // get doc ID's

  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              //print(document.reference.id);
              docIDs.add(document.reference.id);
            }));
  }

  Future<String> exctractUserDocumentId() async {
    String docID = '';
    await getDocID();
    for (int i = 0; i < docIDs.length; i++) {
      await db.collection("Users").doc(docIDs[i]).get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          if (data['email'] == userSettings.email) {
            debugPrint('Identified user document. Extracting data...');
            debugPrint(docIDs[i]);
            docID = docIDs[i];
          }
        },
        onError: (e) => debugPrint("Error getting document: $e"),
      );
    }
    LoadingScreen.documentID = docID;
    return docID;
    // Make a "Aw, Snap!", couldn't find your account screen
  }

  // acces data ig
  Future<void> extractUserData() async {
    String docID = await exctractUserDocumentId();
    debugPrint(docID);
    print(LoadingScreen.userData.completedLessons[0]);
    await db.collection("Users").doc(docID).get().then(
      (DocumentSnapshot doc) {
        debugPrint('Identified document...');
        final data = doc.data() as Map<String, dynamic>;
        debugPrint('Decoded and formatted data...');
        LoadingScreen.userData = user(
            firstName: data['firstName'],
            lastName: data['lastName'],
            userName: data['username'],
            email: data['email'],
            credits: data['credits'],
            completedLessons: data['completedLessons']);
        isExtractionFinished = true;
      },
      onError: (e) => debugPrint("Error getting document: $e"),
    );
    debugPrint('All done! Booting up home screen...');
    print(LoadingScreen.userData.completedLessons[0]);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const EconMadeEasy()),
    );
  }

  void initState() {
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.lock_open_outlined,
              size: 100.0,
            ),
            SizedBox(height: 30),
            Text(
              'Se intra in cont...',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
