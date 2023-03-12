import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../theme/colors.dart';

class Looserpage extends StatelessWidget {
  const Looserpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            elevation: 2,
            title: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Text(
                'You Lost ',
                style: TextStyle(
                    color: blue, fontWeight: FontWeight.w800, fontSize: 25),
              ),
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      '     Sorry, you didn\'t get     enough correct answers. ',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded),
                Padding(
                  padding: const EdgeInsets.only(top: 00),
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
                padding: const EdgeInsets.only(right: 50),
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
    );
  }
}
