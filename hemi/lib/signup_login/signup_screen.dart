import 'package:flutter/material.dart';
import 'package:hemi/signup_login/snack_bar.dart';
import 'package:hemi/signup_login/text_field_input.dart';

import 'auth_method.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool isLoading = false;
  Map<String, dynamic> translations = {};

  List<String> languages = ['English', 'Français', 'عربي'];
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    loadTranslations();
  }

  Future<void> loadTranslations() async {
    String jsonFile = '';

    // Charger le fichier JSON correspondant en fonction de la langue sélectionnée
    if (selectedLanguage == 'English') {
      jsonFile = 'assets/traduction/en.json';
    } else if (selectedLanguage == 'Français') {
      jsonFile = 'assets/traduction/fr.json';
    } else if (selectedLanguage == 'عربي') {
      jsonFile = 'assets/traduction/ar.json';
    }

    String jsonString = await rootBundle.loadString(jsonFile);
    translations = json.decode(jsonString);
    setState(() {}); // Rebuild the UI with the loaded translations
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addressController.dispose();
  }

  void signupUser() async {
    setState(() {
      isLoading = true;
    });

    // Signup user using our auth method
    String res = await AuthMethod().signupUser(
      email: emailController.text,
      password: passwordController.text,
      address: addressController.text,
      name: nameController.text,
    );

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (translations.isEmpty) {
      // Afficher un indicateur de chargement ou une vue vide en attendant le chargement des traductions
      return CircularProgressIndicator();
    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height / 6),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: translations["name"] ?? '',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldInput(
                  textEditingController: emailController,
                  hintText: translations["Enter_your_email"],
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldInput(
                  textEditingController: passwordController,
                  hintText: translations["Enter_your_password"],
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldInput(
                  textEditingController: addressController,
                  hintText: translations["Enter_your_address"],
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: signupUser,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        color: Colors.blue,
                      ),
                      child: Text(translations["Sign_up"]),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 4.5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Choix de langue',
                    ),
                    value: selectedLanguage,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                        loadTranslations();
                      });
                    },
                    items:
                        languages.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
