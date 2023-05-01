import 'package:flutter/material.dart';
import 'package:hemi/home/createad/createadpage.dart';

class CreateadSection extends StatelessWidget {
  const CreateadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      child: Stack(
        children: [
          InkWell(
          onTap: () {
        Navigator.of(context).push(
        MaterialPageRoute(
        builder: (context) => const Createadpage(),
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
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: Colors.blue),
                child: const Text("Publier une annonce"),
              ),
            ),
          ),





        ],

      ),

    );
  }
}
