import 'package:flutter/material.dart';
import '../../signup_login/home_screen.dart';


class Searchresultpage extends StatelessWidget {
  const Searchresultpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [

          ],
        ),
      ),

      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: ()  {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text("return"))
        ],
      ), //bottomNavigationBar: NavigationBar(),
    );
  }
}
