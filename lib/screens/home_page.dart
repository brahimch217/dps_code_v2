// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, sized_box_for_whitespace, unused_import, unused_local_variable, non_constant_identifier_names, use_full_hex_values_for_flutter_colors, avoid_print, avoid_unnecessary_containers, unused_element

import 'package:esp/model/coolors.dart';
import 'package:esp/screens/add_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  static Future<User?> loginModel({
    required String email,
    required String pass,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("no user");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final screen_size = MediaQuery.of(context).size;
    print("===========================");
    print(screen_size);
    print("================");
    return Scaffold(
      backgroundColor: Coolors.main_color,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: screen_size.height,
            width: screen_size.width,
            child: Image.asset(
              "assets/back.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 80),
          //   child: Text(
          //     "Disaster Prediction System",
          //     style: GoogleFonts.aBeeZee(
          //       fontSize: 80,
          //       color: Coolors.for_color,
          //     ),
          //   ),
          // ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Coolors.fiv_color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 30,
                    offset: Offset(20, 10), // changes position of shadow
                  ),
                ],
              ),
              height: screen_size.height * 0.63371356147,
              width: screen_size.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screen_size.width * 0.34722222222,
                    //color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Title
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 15),
                          child: Text(
                            "Disaster Prediction System",
                            style: GoogleFonts.aBeeZee(
                              color: Coolors.sec_color,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        // Header Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0, left: 15),
                              child: Text(
                                "Login to your ",
                                style: GoogleFonts.aBeeZee(
                                  color: Coolors.text_color,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0, left: 2),
                              child: Text(
                                "Saller Space ",
                                style: GoogleFonts.aBeeZee(
                                  color: Coolors.sec_color,
                                  // decoration: TextDecoration.underline,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Email Input
                        Padding(
                          padding: EdgeInsets.only(top: 70),
                          child: Container(
                            width: 400,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                suffixIcon: Icon(
                                  Icons.email,
                                ),
                              ),
                              controller: emailController,
                            ),
                          ),
                        ),
                        // Password Input
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 400,
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                              controller: passController,
                            ),
                          ),
                        ),
                        // Login Button
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: InkWell(
                            onTap: () async {
                              User? user = await loginModel(
                                  email: emailController.text,
                                  pass: passController.text,
                                  context: context);
                              print(user);
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => product_screen(),
                                  ),
                                );
                              }
                            },
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 60),
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Coolors.sec_color,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
