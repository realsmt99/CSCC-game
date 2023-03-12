import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../theme/colors.dart';

class LoserXo extends StatefulWidget {
  const LoserXo({super.key});

  @override
  State<LoserXo> createState() => _LoserXoState();
}

class _LoserXoState extends State<LoserXo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 2,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You Lost ',
                      style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.w800,
                          fontSize: 25),
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('images/lose (1).png'),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 30, left: 20),
                      child: Text(
                        '     Sorry, you didn\'t ',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 20),
                      child: Text(
                        '  Win. ',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                    Padding(
                      padding: const EdgeInsets.only(top: 00, right: 00),
                      child: Text(
                        'We would love to hear \nyour thoughts on your\n experience with us.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("homePage");
                      },
                      child: Text('Close'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.notes_rounded),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("feedback");
                      },
                      label: Text('feedback'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
