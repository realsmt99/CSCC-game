import 'package:flutter/material.dart';
import 'package:flutter_finance_app/Games/quizhh.dart';
import 'package:flutter_finance_app/theme/colors.dart';

class Winner extends StatelessWidget {
  const Winner({
    Key? key,
  }) : super(key: key);

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
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'Congratulations!',
                style: TextStyle(color: blue, fontWeight: FontWeight.w800),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('images/fireworks.png'),
                ),
                Text(
                  'You Won!! ',
                  style: TextStyle(
                      fontSize: 25, color: black, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'We would love to hear \nyour thoughts on your\n experience with us.',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("feedback");
                  },
                  child: Text('Leave feedback'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
