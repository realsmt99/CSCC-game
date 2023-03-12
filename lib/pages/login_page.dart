import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_finance_app/firebase_options.dart';
import 'package:flutter_finance_app/pages/home_page.dart';
import 'package:flutter_finance_app/theme/colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // key for the login form
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("images/logo.png"), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270, bottom: 10),
              child: Text(
                "Hello",
                style: TextStyle(
                    fontSize: 23, fontWeight: FontWeight.bold, color: blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 119),
              child: Text(
                "Login first to continue .",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, bottom: 5, right: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                          controller: _usernameController,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: black,
                            hintText: "Username",
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, bottom: 5, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff67727d)),
                      ),
                      TextField(
                        obscureText: true,
                        cursorColor: black,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: black),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            prefixIconColor: Colors.black,
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            suffixIconColor: Colors.black,
                            hintText: "Password",
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await Firebase.initializeApp(
                      options: DefaultFirebaseOptions.currentPlatform);
                  final userCredential =
                      await FirebaseAuth.instance.signInAnonymously();
                  final user = userCredential.user;
                  final username = _usernameController.text;
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(user!.uid)
                      .set({'username': username});
                  Navigator.of(context).pushReplacementNamed("homePage");
                }
              },
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
