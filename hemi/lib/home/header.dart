import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hemi/home/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final displayName = currentUser?.displayName ?? '';

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome ${displayName},",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Que cherchez vous ?",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
              child: const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
 



/*return Scaffold(
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
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        _userData != null && _userData!['photoUrl'] != null
                            ? NetworkImage(_userData!['photoUrl'])
                            : AssetImage('assets/images/default_profile.png')
                                as ImageProvider,
                  ),
                   Positioned(
                    bottom: -10,
                    right: -10,
                    child: Transform.translate(
                      offset: Offset(5, -5),
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: Icon(Icons.edit),
                        iconSize: 40,
                      ),
                    ),
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Name:  ${_userData!['name']}',
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
                            'email: ${_user!.email}',
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
              ))); */