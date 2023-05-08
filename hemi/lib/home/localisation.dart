import 'package:flutter/material.dart';

class LocalisationSection extends StatelessWidget {
  const LocalisationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      child: Stack(
        children: [
          TextField(
            cursorColor: const Color(0xFF5F67EA),
            decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 0, 4, 17),
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
              ),
              hintText: "Localisation",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
