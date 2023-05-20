/*import 'package:hemi/signup_login/auth_method.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var data;


  @override
  void initState() {
    AuthMethod().getInfo().then((value){
      data = value;
      if(mounted){
        setState(() {});
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(18, 38, 67, 1),
        title: Text('Profile Page'),

      ),
      body: data != null ?  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Padding(
            padding:  EdgeInsets.all(29.0),
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(18, 38, 67, 1),
              radius: 63,
              backgroundImage: NetworkImage(data['image']),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color:const Color.fromRGBO(214, 224, 239, 1),
                  borderRadius: BorderRadius.circular(11)),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Name: ${data['name']}',style:const TextStyle(color: Color.fromRGBO(18, 38, 67, 0.82),fontWeight: FontWeight.w300),),
                  )),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color:const Color.fromRGBO(214, 224, 239, 1),
                  borderRadius: BorderRadius.circular(11)),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('email: ${data['email']}',style:const TextStyle(color: Color.fromRGBO(18, 38, 67, 0.82),fontWeight: FontWeight.w300),),
                    )),
            ),
          )
        ],
      ): Center(child: CircularProgressIndicator(color: Colors.indigo,),),
    );
  }
}
*/

/*
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      _user = user;
      _userData = userData.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userData == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          appBar: AppBar(title: Text('Profil')),
          /*  body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nom d\'utilisateur: ${_userData!['name']}'),
              Text('Adresse email: ${_user!.email}'),
              // Ajoutez d'autres informations utilisateur ici
            ],
          ),*/
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(29.0),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(18, 38, 67, 1),
                  radius: 63,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(214, 224, 239, 1),
                      borderRadius: BorderRadius.circular(11)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Name:  ${_userData!['name']}',
                          style: const TextStyle(
                              color: Color.fromRGBO(18, 38, 67, 0.82),
                              fontWeight: FontWeight.w300),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(214, 224, 239, 1),
                      borderRadius: BorderRadius.circular(11)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'email: ${_user!.email}',
                          style: const TextStyle(
                              color: Color.fromRGBO(18, 38, 67, 0.82),
                              fontWeight: FontWeight.w300),
                        ),
                      )),
                ),
              )
            ],
          ));
    }
  }
}
*/
/*
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      _user = user;
      _userData = userData.data();
    });
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_userData == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          appBar: AppBar(title: Text('Profil')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(29.0),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(18, 38, 67, 1),
                  radius: 63,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(214, 224, 239, 1),
                      borderRadius: BorderRadius.circular(11)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Name:  ${_userData!['name']}',
                          style: const TextStyle(
                              color: Color.fromRGBO(18, 38, 67, 0.82),
                              fontWeight: FontWeight.w300),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(214, 224, 239, 1),
                      borderRadius: BorderRadius.circular(11)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'email: ${_user!.email}',
                          style: const TextStyle(
                              color: Color.fromRGBO(18, 38, 67, 0.82),
                              fontWeight: FontWeight.w300),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ElevatedButton(
                  onPressed: _logout,
                  child: Text('Déconnexion'),
                ),
              )
            ],
          ));
    }
  }
}
*/
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hemi/signup_login/auth_method.dart';
import 'package:hemi/signup_login/login_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';

import '../../mes annonce/annonce.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;
  Map<String, dynamic>? _userData;
  File? _imageFile;
  String? _downloadUrl;
  bool _isNightMode = false;
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    String userName = userData['name'];
    setState(() {
      _user = user;
      _userData = userData.data();
      _userName = userName;
    });
  }

  Future _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });

    // Appeler _saveImage() uniquement si l'image est sélectionnée
    if (_imageFile != null) {
      await _saveImage();
    }
  }

  Future<void> convertToJpeg(File imageFile) async {
    final filePath = imageFile.path;
    final fileExtension = p.extension(filePath).toLowerCase();

    if (fileExtension == '.jpg' || fileExtension == '.jpeg') {
      return; // L'image est déjà au format JPEG, pas besoin de conversion
    }

    final image = img.decodeImage(imageFile.readAsBytesSync());

    final jpegImage = img.encodeJpg(image!);

    final convertedFile = File('${p.withoutExtension(filePath)}.jpg');
    await convertedFile.writeAsBytes(jpegImage);

    // Utiliser le fichier converti dans votre application
    // ...
  }

  Future _saveImage() async {
    final user = FirebaseAuth.instance.currentUser;
    final storage = FirebaseStorage.instance;
    final reference = storage.ref().child('users/${user!.uid}/profile.jpg');
    // Convertir l'image en JPEG
    await convertToJpeg(_imageFile!);
    await reference.putFile(_imageFile!);

    final downloadUrl = await reference.getDownloadURL();
    setState(() {
      _downloadUrl = downloadUrl;
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'photoUrl': _downloadUrl});
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      final storageRef =
          FirebaseStorage.instance.ref().child('profile_images/${_user!.uid}');
      final uploadTask = storageRef.putFile(_imageFile!);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        _downloadUrl = downloadUrl;
      });
      FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .update({'photoUrl': _downloadUrl});
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    // Appeler _uploadImage() uniquement si l'image est sélectionnée
    if (_imageFile != null) {
      await _uploadImage();
    }
  }

  void _viewProfilePhoto() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pop(); // Ferme la boîte de dialogue lorsque l'utilisateur clique sur la photo agrandie
            },
            child: Image.network(_userData!['photoUrl']),
          ),
        );
      },
    );
  }

  void _toggleNightMode() {
    setState(() {
      _isNightMode = !_isNightMode;
    });
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _changeName() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newName = _userName; // Valeur initiale du nom actuel

        return AlertDialog(
          title: Text('Modifier le nom'),
          content: TextField(
            onChanged: (value) {
              newName = value; // Mettre à jour la nouvelle valeur du nom
            },
            decoration: InputDecoration(
              labelText: 'Nouveau nom',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                final userRef = FirebaseFirestore.instance
                    .collection('users')
                    .doc(user!.uid);

                // Mettre à jour le nom dans la base de données
                await userRef.update({'name': newName});

                setState(() {
                  _userName =
                      newName; // Mettre à jour le nom dans l'état du widget
                });

                Navigator.pop(context); // Fermer la boîte de dialogue
              },
              child: Text('Valider'),
            ),
          ],
        );
      },
    );
  }

  void _changeEmail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newEmail = ''; // Nouvelle adresse e-mail

        return AlertDialog(
          title: Text('Modifier l\'adresse e-mail'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newEmail = value; // Mettre à jour la nouvelle adresse e-mail
                },
                decoration: InputDecoration(
                  labelText: 'Nouvelle adresse e-mail',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final user = FirebaseAuth.instance.currentUser;

                    // Mettre à jour l'adresse e-mail de l'utilisateur
                    await user!.updateEmail(newEmail);

                    Navigator.pop(context); // Fermer la boîte de dialogue

                    // Afficher une boîte de dialogue pour informer l'utilisateur que l'adresse e-mail a été modifiée avec succès
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Succès'),
                          content: Text(
                              'L\'adresse e-mail a été modifiée avec succès.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context); // Fermer la boîte de dialogue
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } catch (error) {
                    // Gérer les erreurs lors de la modification de l'adresse e-mail
                    String errorMessage =
                        'Une erreur s\'est produite lors de la modification de l\'adresse e-mail. Veuillez réessayer.';
                    if (error is FirebaseAuthException) {
                      errorMessage = error.message ?? errorMessage;
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Erreur'),
                          content: Text(errorMessage),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context); // Fermer la boîte de dialogue
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Modifier'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_userData == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            actions: [
              IconButton(
                icon: Icon(
                    _isNightMode ? Icons.wb_sunny : Icons.nightlight_round),
                onPressed: _toggleNightMode,
              ),
            ],
          ),
          body: Container(
              color: _isNightMode ? Colors.black : Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap:
                            _viewProfilePhoto, // Affiche la photo de profil agrandie lorsque l'utilisateur clique dessus
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _userData != null &&
                                  _userData!['photoUrl'] != null
                              ? NetworkImage(_userData!['photoUrl'])
                              : AssetImage('assets/images/default_profile.png')
                                  as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Icon(
                              Icons.photo_camera,
                              size: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _isNightMode
                            ? Colors.grey[800]
                            : const Color.fromRGBO(214, 224, 239, 1),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Name: $_userName',
                              style: TextStyle(
                                color:
                                    _isNightMode ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _changeName,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _isNightMode
                            ? Colors.grey[800]
                            : const Color.fromRGBO(214, 224, 239, 1),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'email: ${_user!.email}',
                                style: TextStyle(
                                  color: _isNightMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              GestureDetector(
                                onTap: _changeEmail,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _isNightMode
                            ? Colors.grey[800]
                            : const Color.fromRGBO(214, 224, 239, 1),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'address:  ${_userData!['address']}',
                            style: TextStyle(
                              color: _isNightMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: ElevatedButton(
                      onPressed: _logout,
                      child: Text('Déconnexion'),
                      style: ElevatedButton.styleFrom(
                        primary: _isNightMode ? Colors.grey[800] : null,
                      ),
                    ),
                  ),
                ],
              )));
    }
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff6f8ff),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xFF5F67EA),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                label: 'Accueil',
                icon: Icon(
                  Icons.home_rounded,
                  size: 50,
                ),
              ),
              BottomNavigationBarItem(
                label: "Annonces",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.messenger,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Profil",
                icon: InkWell(
                  onTap: () {
                    // Naviguer vers la page de profil
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
            onTap: (int index) {
              if (index == 1) {
                // Naviguer vers la page de discussion
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnoncesPage()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
