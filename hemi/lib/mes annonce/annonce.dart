import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../home/searchresults/announcement_details_page.dart';

User? user = FirebaseAuth.instance.currentUser;

Future<List<DocumentSnapshot>> fetchAnnonces() async {
  List<DocumentSnapshot> annonces = [];

  try {
    // Récupérer l'ID de l'utilisateur actuel
    String userId = user?.uid ?? '';

    // Référence à la collection "Annonces" dans Firestore
    CollectionReference annoncesRef =
        FirebaseFirestore.instance.collection("Annonces");

    // Exécuter la requête pour récupérer les annonces de l'utilisateur actuel
    QuerySnapshot querySnapshot =
        await annoncesRef.where("auteurId", isEqualTo: userId).get();

    // Récupérer les documents d'annonce correspondants
    annonces = querySnapshot.docs;
  } catch (e) {
    print('Erreur lors de la récupération des annonces : $e');
  }

  return annonces;
}

class AnnoncesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Annonces'),
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: fetchAnnonces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erreur : ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> annonces = snapshot.data!;
            return ListView.builder(
              itemCount: annonces.length,
              itemBuilder: (context, index) {
                DocumentSnapshot annonce = annonces[index];
                String description = annonce['description'];
                String location = annonce['location'];
                String module = annonce['module'];
                String title = annonce['titre'];
                // Utilisez les valeurs récupérées comme vous le souhaitez
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnnouncementDetailsPage(
                          annonce: annonce,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Description: $description',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Lieu: $location',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Module: $module',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('Aucune annonce disponible'),
            );
          }
        },
      ),
    );
  }
}

class AnnouncementDetailsPage extends StatelessWidget {
  final DocumentSnapshot annonce;

  AnnouncementDetailsPage({required this.annonce});

  @override
  Widget build(BuildContext context) {
    // Utilisez les données de l'annonce pour afficher les détails
    String title = annonce['titre'];
    String description = annonce['description'];
    String location = annonce['location'];
    String module = annonce['module'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'annonce'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Description: $description',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Lieu: $location',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Module: $module',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
