import 'package:flutter/material.dart';
import 'package:hemi/signup_login/snack_bar.dart';
import 'package:hemi/signup_login/text_field_input.dart';

import 'auth_method.dart';
import 'login_screen.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void resetPassword() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthMethod().resetPassword(emailController.text);

    if (res == "success") {
      showSnackBar(context, "Password reset link sent to your email");
      // Rediriger vers l'écran de connexion
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      showSnackBar(context, res);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your email to receive a password reset link:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextFieldInput(
              textEditingController: emailController,
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: resetPassword,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: Colors.blue,
                ),
                child: const Text("Reset Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
