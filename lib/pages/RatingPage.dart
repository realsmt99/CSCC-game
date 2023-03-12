import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_finance_app/theme/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TransectionPage extends StatefulWidget {
  const TransectionPage({super.key});

  @override
  State<TransectionPage> createState() => _TransectionPageState();
}

class _TransectionPageState extends State<TransectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primary,
        body: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
                child: Column(children: [
              Center(
                child: Container(
                  height: 550,
                  width: 300,
                  margin: EdgeInsets.only(
                    top: 25,
                    left: 25,
                    right: 25,
                  ),
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
                        top: 20, bottom: 25, right: 20, left: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("images/logo.png")),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: (size.width - 40) * 0.6,
                              child: Column(
                                children: [
                                  Text(
                                    "GAME SEASON",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: blue),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "We would like to take this opportunity to thank you for trying out our app. Your feedback and support are highly appreciated, and we are glad to have you as part of our community.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: black),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary: blue,
                                            onPrimary: Colors
                                                .white, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states

                                            shadowColor: Colors.black,
                                            elevation: 4.0,

                                            minimumSize: Size(20, 40),

                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        35.0)),
                                            enabledMouseCursor:
                                                MouseCursor.defer,

                                            visualDensity: VisualDensity(
                                                horizontal: 0.0, vertical: 0.0),
                                            tapTargetSize: MaterialTapTargetSize
                                                .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
                                          ),
                                          onPressed: () async {
                                            await FirebaseAuth.instance
                                                .signOut();
                                            Navigator.of(context)
                                                .pushReplacementNamed("login");
                                          },
                                          icon: Icon(
                                            Icons.logout,
                                            color: black,
                                          ),
                                          label: Text(
                                            "Logout",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ])),
          ),
        )));
  }
}
