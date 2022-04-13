// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors, avoid_print, prefer_final_fields, unused_field, unused_local_variable, deprecated_member_use, prefer_const_literals_to_create_immutables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/coolors.dart';

class product_screen extends StatefulWidget {
  product_screen({Key? key, this.app}) : super(key: key);

  FirebaseApp? app;
  @override
  State<product_screen> createState() => _product_screenState();
}

class _product_screenState extends State<product_screen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _addController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  final ref = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final refrence = ref.reference();
    final screen_size = MediaQuery.of(context).size;
    print(screen_size);
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
                    offset: Offset(20, 10),
                  ),
                ],
              ),
              height: screen_size.height * 0.63371356147,
              width: screen_size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Text(
                      "Add a client ",
                      style: GoogleFonts.aBeeZee(
                        color: Coolors.sec_color,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Name Input
                      Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: Container(
                          width: screen_size.width * 0.20833333333,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Client Name ",
                              suffixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                            controller: _nameController,
                          ),
                        ),
                      ),
                      // Phone Input
                      Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: Container(
                          width: screen_size.width * 0.20833333333,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Client Phone Number ",
                              suffixIcon: Icon(
                                Icons.phone,
                              ),
                            ),
                            controller: _phoneController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Addrese input
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: screen_size.width * 0.3125,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Client Addrese",
                          suffixIcon: Icon(
                            Icons.place,
                          ),
                        ),
                        controller: _addController,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Email input
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: screen_size.width * 0.20833333333,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Client Email",
                              suffixIcon: Icon(
                                Icons.email,
                              ),
                            ),
                            controller: _emailController,
                          ),
                        ),
                      ),
                      // Product id Input
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: screen_size.width * 0.20833333333,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Product id",
                              suffixIcon: Icon(
                                Icons.pin_rounded,
                              ),
                            ),
                            controller: _idController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Add Button
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: InkWell(
                      onTap: () {
                        refrence
                            .child(_idController.text)
                            .child("name")
                            .set(_nameController.text)
                            .asStream();
                        refrence
                            .child(_idController.text)
                            .child("phone")
                            .set(_phoneController.text)
                            .asStream();
                        refrence
                            .child(_idController.text)
                            .child("addrese")
                            .set(_addController.text)
                            .asStream();
                        refrence
                            .child(_idController.text)
                            .child("email")
                            .set(_emailController.text)
                            .asStream();
                        refrence
                            .child(_idController.text)
                            .child("value")
                            .set(0)
                            .asStream();

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            // dismissDirection: DismissDirection.horizontal,
                            backgroundColor: Coolors.for_color,
                            duration: Duration(seconds: 5),
                            content: Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Client has been added successfully",
                                    style: GoogleFonts.poppins(fontSize: 30),
                                  ),
                                  Text(
                                    "Here is your client data",
                                    style: GoogleFonts.poppins(fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "client name : ",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              _nameController.text,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "client Phone number : ",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              _phoneController.text,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "client Addrese : ",
                                        style:
                                            GoogleFonts.poppins(fontSize: 20),
                                      ),
                                      Text(
                                        _addController.text,
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "client Email : ",
                                            style: GoogleFonts.poppins(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            _emailController.text,
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Product ID number : ",
                                            style: GoogleFonts.poppins(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            _idController.text,
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        _addController.clear();
                        _emailController.clear();
                        _phoneController.clear();
                        _idController.clear();
                        _nameController.clear();
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
                              "Add",
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
          ),
        ],
      ),
    );
  }
}
