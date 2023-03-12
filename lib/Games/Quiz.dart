// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_finance_app/Games/quizhh.dart';

import 'package:flutter_finance_app/data/XO+QUIZdata.dart';
import 'package:flutter_finance_app/data/question.dart';
import 'package:flutter_finance_app/theme/colors.dart';

class Quizgame extends StatefulWidget {
  const Quizgame({super.key});

  @override
  State<Quizgame> createState() => _QuizgameState();
}

class _QuizgameState extends State<Quizgame> {
  int? i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0072FF),
                      Color(0xFF00C6FF),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "QUIZOO",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: white),
                      ),
                      Icon(
                        Icons.timer,
                        color: white,
                      ),
                    ],
                  ),
                )),
            SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  height: 800,
                  margin: EdgeInsets.only(top: 100),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: primary),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      children: [
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.black,
                          size: 45,
                        ),
                        Optionsgg(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
