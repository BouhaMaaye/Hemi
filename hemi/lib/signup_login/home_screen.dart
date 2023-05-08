import 'package:flutter/material.dart';
import 'package:hemi/home/header.dart';
import 'package:hemi/home/search.dart';
import 'package:hemi/home/localisation.dart';
import 'package:hemi/home/searchbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../home/createadbutton.dart';
import '../home/searchresults/searchresultpage.dart';
import 'auth_method.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController moduleController = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();

  List<String> _items = ["chimieee"];
  List<String> _filteredItems = [];

  final TextEditingController _controller = TextEditingController();
  bool _isDropdownOpen = false; // Add this
  @override
  void initState() {
    super.initState();
    print(_items);
    _getItemsFromFirebase();
  }

  void _getItemsFromFirebase() {
    FirebaseFirestore.instance.collection('module').get().then((querySnapshot) {
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
      moduleController.text = selectedItem;

      _controller.text = selectedItem;
    });
    _isDropdownOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                HeaderSection(),
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
                TextField(
                  controller: locationcontroller,
                  cursorColor: Color.fromARGB(255, 0, 1, 9),
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 243, 244, 247),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    prefixIcon: const Icon(
                      Icons.location_pin,
                      size: 30,
                      color: Colors.black,
                    ),
                    hintText: "Localisation",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Searchresultpage(
                            locationcontroller: locationcontroller.text,
                            moduleController: _controller.text),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          color: Colors.blue),
                      child: const Text("Search"),
                    ),
                  ),
                ),
                CreateadSection(),
                // const LocalisationSection(),
              ],
            )
          ],
        ),
      ),

      //bottomNavigationBar: NavigationBar(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
