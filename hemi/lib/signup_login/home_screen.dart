import 'package:flutter/material.dart';
import 'package:hemi/home/header.dart';
import 'package:hemi/home/search.dart';

import 'auth_method.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.identity()..rotateZ(20),
              origin: const Offset(150, 50),
              child: Image.asset(
                'assets/images/bg_liquid.png',
                width: 200,
              ),
            ),
            Positioned(
              right: 0,
              top: 200,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(20),
                origin: const Offset(180, 100),
                child: Image.asset(
                  'assets/images/bg_liquid.png',
                  width: 200,
                ),
              ),
            ),
            Column(
              children: [
                const HeaderSection(),
                const SearchSection(),
                // const LocalisationSection(),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () async {
                await AuthMethod().signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const Text("LogOut"))
        ],
      ),
      //bottomNavigationBar: NavigationBar(),
    );
  }
}
