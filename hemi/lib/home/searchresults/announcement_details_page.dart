import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementDetailsPage extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> announcementSnapshot;

  const AnnouncementDetailsPage({
    required this.announcementSnapshot,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final announcementData = announcementSnapshot.data();

    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    announcementData['auteurPhoto'] ?? '',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                announcementData['module'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Center(
              child: Text(
                announcementData['titre'],
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 4),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    announcementData['location'],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Center(
              child: Text(
                announcementData['description'],
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  SizedBox(height: 30), // Ajout d'un espace de 8 pixels
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch(
                              'whatsapp://send?phone=${announcementData['whatsapp']}');
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/whatsapp.png',
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'WhatsApp: ${announcementData['whatsapp']}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Phone: ${announcementData['phone']}',
                        style: TextStyle(
                          fontSize: 16,
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
  }
}
