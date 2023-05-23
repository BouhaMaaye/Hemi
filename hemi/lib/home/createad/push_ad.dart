import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Pushad {
  final databaseReference = FirebaseFirestore.instance;

  Future<String> addModuleIfNotExists(
      {required String module,
      required String titre,
      required String description,
      required String location}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final auteurId = user.uid;
      final auteurPhoto = (await FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: auteurId).get()).docs.first.data()?['photoUrl'];
      print("yaaaaaay");
      print(auteurPhoto);
      final snapshot = await databaseReference
          .collection('Annonces')
          .where('module', isEqualTo: module)
          .where('titre', isEqualTo: titre)
          .where('auteurId', isEqualTo: auteurId)
          .get();

      if (snapshot.docs.isEmpty) {
        await databaseReference.collection('Annonces').add({
          'module': module,
          'titre': titre,
          'description': description,
          'location': location,
          'auteurPhoto':auteurPhoto,
          'auteurId':auteurId, // Ajouter le champ auteurId avec l'ID de l'utilisateur actuel
        });
        return 'success';
      }

      return 'Module with this name already exists';
    } else {
      return 'User not authenticated';
    }
  }
}
