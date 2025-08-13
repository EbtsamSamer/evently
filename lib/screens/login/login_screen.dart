import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/screens/home/home_screen.dart';
import 'package:evently/screens/login/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 60),
            Center(child: Image.asset("assets/images/logo_v.png")),
            SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: ImageIcon(
                  AssetImage("assets/images/email_ic.png"),
                  color: Color(0xFF7B7B7B),
                ),
                label: Text(
                  "Email",
                  style: GoogleFonts.inter(
                    color: Color(0xFF7B7B7B),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Color(0xFF7B7B7B)),
                suffixIcon: Icon(Icons.remove_red_eye),
                label: Text(
                  "Password",
                  style: GoogleFonts.inter(
                    color: Color(0xFF7B7B7B),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: GoogleFonts.inter(
                  color: Color(0xFF5669FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 24),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 60),
                backgroundColor: Color(0xFF5669FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                FirebaseManager.login(
                  email: emailController.text,
                  password: passwordController.text,
                  OnError: (message) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Error",
                          style: GoogleFonts.inter(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        content: Text(
                          message,
                          style: GoogleFonts.inter(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Okay",
                              style: GoogleFonts.inter(
                                color: Colors.indigo,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  OnSuccess: () {
                    userProvider.initUser();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => false,
                    );
                  },
                );
              },
              child: Text(
                "Login",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don’t Have Account ? ",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    text: "Create Account ",
                    style: GoogleFonts.inter(
                      decoration: TextDecoration.underline,
                      color: Color(0xFF5669FF),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  child: Divider(color: Colors.blue, indent: 20, endIndent: 24),
                ),
                Text(
                  "Or",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Divider(indent: 24, endIndent: 32, color: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 60),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.blue, width: 1),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage("assets/images/google_ic.png")),
                  SizedBox(width: 7),
                  Text(
                    "Login With Google",
                    style: GoogleFonts.inter(
                      color: Color(0xFF5669FF),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
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
