import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app/Games/Quiz.dart';
import 'package:flutter_finance_app/Games/XO.dart';
import 'package:flutter_finance_app/feedback.dart/feedback.dart';
import 'package:flutter_finance_app/pages/Looser.dart';
import 'package:flutter_finance_app/pages/LooserXo.dart';

import 'package:flutter_finance_app/pages/WinnerPage.dart';
import 'package:flutter_finance_app/pages/firstpage.dart';

import 'package:flutter_finance_app/pages/home_page.dart';
import 'package:flutter_finance_app/pages/login_page.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: AnimatedSplashScreen(
        splash: Container(
          child: Image.asset("images/logo.png"),
        ),
        nextScreen: LoginPage(),
      ),
      routes: {
        "login": (context) => LoginPage(),
        "quizapp": (context) => Quizgame(),
        "Xogame ": (context) => XOgame(),
        "Winnerpage": (context) => Winner(),
        "Looser": (context) => Looserpage(),
        "homePage": (context) => HomePage(),
        "feedback": (context) => FeedbackPage(),
        "loseXo": (context) => LoserXo()
      },
    );
  }
}
