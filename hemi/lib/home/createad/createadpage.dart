import 'package:flutter/material.dart';
import 'package:hemi/home/createad/push_ad.dart';
import '../../signup_login/home_screen.dart';
import 'package:hemi/signup_login/text_field_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Createadpage extends StatefulWidget {
  const Createadpage({super.key});
  @override
  State<Createadpage> createState() => _CreateadpageState();
}


class _CreateadpageState extends State<Createadpage> {
  final TextEditingController moduleController = TextEditingController();
  final TextEditingController titreController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    titreController.dispose();
    descriptionController.dispose();
    moduleController.dispose();
    locationController.dispose();
  }

  void addModuleIfNotExists() async {
    setState(() {
      isLoading = true;
    });
    print("hey");
    String res = await Pushad().addModuleIfNotExists(
        module: moduleController.text,
        titre: titreController.text,
        description: descriptionController.text,
        location: locationController.text);
    // if string return is success, user has been creaded and navigate to next screen other witse show error.
    if (res == "success") {
      print("hey2");

      setState(() {
        isLoading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height / 4.3),
                TextFieldInput(
                    textEditingController: moduleController,
                    hintText: 'Quelle module voulez vous enseignez ? ',
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                    textEditingController: titreController,
                    hintText: 'Donnez un titre à votre annonce',
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: descriptionController,
                  hintText: 'Donnez une description détaillée de votre annonce',
                  textInputType: TextInputType.text,

                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                    textEditingController: locationController,
                    hintText: 'Où allez-vous enseigner ?',
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: addModuleIfNotExists,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                          color: Colors.blue),
                      child: const Text("Publier l'annonce"),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 4.3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      /*onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },

                       */
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: ()  {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
                child: const Text("return"))
          ],
          //bottomNavigationBar: NavigationBar(),
        )
    );


  }
}

