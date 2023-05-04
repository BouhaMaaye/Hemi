import 'package:cloud_firestore/cloud_firestore.dart';

class Pushad {
  final databaseReference = FirebaseFirestore.instance;

  Future<String> addModuleIfNotExists({required String module, required String titre,
  required String description, required String location}) async {
    final snapshot = await databaseReference
        .collection('Annonces')
        .where('module', isEqualTo: module)
        .where('titre', isEqualTo: titre)
        .get();
    if (snapshot.docs.isEmpty) {
      await databaseReference.collection('Annonces').add({
        'module': module,
        'titre': titre,
        'description': description,
        'location': location,
      });
      return 'success';
    }

    return 'Module with this name already exists';
  }
}