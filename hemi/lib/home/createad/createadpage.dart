import 'package:flutter/material.dart';
import 'package:hemi/home/createad/push_ad.dart';
import '../../signup_login/home_screen.dart';
import 'package:hemi/signup_login/text_field_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'adcreated.dart';


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

  List<String> _items = ["chimieee"];
  List<String> _filteredItems = [];

  final TextEditingController _controller = TextEditingController();
  bool _isDropdownOpen = false; // Add this
  @override
  void dispose() {
    super.dispose();
    titreController.dispose();
    descriptionController.dispose();
    moduleController.dispose();
    locationController.dispose();
  }
  @override
  void initState() {
    super.initState();
    print(_items);
    _getItemsFromFirebase();
  }
  void _getItemsFromFirebase() {
    FirebaseFirestore.instance
        .collection('module')
        .get()
        .then((querySnapshot) {
      List<String> items = [];
      querySnapshot.docs.forEach((doc) {
        String name = doc.data()['name'];
        if (name != null) {
          items.add(name);
        }
      });
      setState(() {
        print(items);
        _items = items;
        _filteredItems = items;
      });
    });
  }

  void _onSearchTextChanged(String query) {
    List<String> results = [];
    _items.forEach((item) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        results.add(item);
      }
    });
    setState(() {
      _filteredItems = results;
    });
  }
  void _onItemSelected(String selectedItem) {
    setState(() {
      _controller.text = selectedItem;
      moduleController.text = selectedItem;
    });
    _isDropdownOpen = false;
  }
  void addModuleIfNotExists() async {
    setState(() {
      isLoading = true;
    });
    String res = await Pushad().addModuleIfNotExists(
        module: moduleController.text,
        titre: titreController.text,
        description: descriptionController.text,
        location: locationController.text);
    // if string return is success, user has been creaded and navigate to next screen other witse show error.
    if (res == "success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AdCreatedPage()));

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
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                    onChanged: _onSearchTextChanged,
                    onTap: () {
                      setState(() {
                        _isDropdownOpen = true;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: _isDropdownOpen,
                  child: Positioned(
                    top: 150, // ajustez la position en fonction de vos besoins
                    left: 0,
                    right: 0,
                    child: Container(
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: _filteredItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(_filteredItems[index]),
                              onTap: () {
                                _onItemSelected(_filteredItems[index]);
                              },

                            );
                          },
                        ),
                      ),
                    ),
                  ),
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

