import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'announcement_details_page.dart';

class Searchresultpage extends StatefulWidget {
  final String locationcontroller;
  final String moduleController;

  const Searchresultpage({
    required this.locationcontroller,
    required this.moduleController,
    Key? key,
  }) : super(key: key);

  @override
  _SearchresultpageState createState() => _SearchresultpageState();
}

class _SearchresultpageState extends State<Searchresultpage> {
  late Stream<QuerySnapshot> _announcementsStream;

  @override
  void initState() {
    print("********************zzzzzzzzzzz");
    print(widget.locationcontroller);
    super.initState();
    _announcementsStream = FirebaseFirestore.instance
        .collection('Annonces')
        .where('location', isEqualTo: widget.locationcontroller)
        .where('module', isEqualTo: widget.moduleController)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _announcementsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No announcements found.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var announcementSnapshot = snapshot.data!.docs[index]
                  as QueryDocumentSnapshot<Map<String, dynamic>>;
              var photoUrll = announcementSnapshot.data()['photoUrl'];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnnouncementDetailsPage(
                          announcementSnapshot: announcementSnapshot,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'photoUrll',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              announcementSnapshot['module'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              announcementSnapshot['titre'],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              announcementSnapshot['description'],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 4),
                                Text(
                                  announcementSnapshot['location'],
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
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
        },
      ),
    );
  }
}
