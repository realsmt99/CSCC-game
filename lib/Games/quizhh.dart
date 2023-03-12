// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import '../data/XO+QUIZdata.dart';
import '../theme/colors.dart';

class Optionsgg extends StatefulWidget {
  Optionsgg({
    Key? key,
  }) : super(key: key);

  @override
  State<Optionsgg> createState() => _OptionsggState();
}

class _OptionsggState extends State<Optionsgg> {
  Color truecolor = Colors.green;
  Color falsecolor = Colors.red;
  Color coloravatar1 = Color(0xFF0072FF);
  Color coloravatar2 = Color(0xFF0072FF);
  Color coloravatar3 = Color(0xFF0072FF);
  Color coloravatar4 = Color(0xFF0072FF);
  Color coloravatar5 = Color(0xFF0072FF);
  Color coloravatar6 = Color(0xFF0072FF);
  Color coloravatar7 = Color(0xFF0072FF);
  List<int> repeated = [];
  int randomindex = 0;
  int correctanswers = 0;
  int nocorrect = 0;
  void pickRandomQuestion() {
    final random = Random();
    int index = random.nextInt(AppBrain().mobileDevQuiz.length);
    while (repeated.contains(index) == true) {
      index = random.nextInt(AppBrain().mobileDevQuiz.length);
    }
    repeated.add(index);

    setState(() {
      randomindex = index;
    });
  }

  int questions = 0;
  double lenearindicator = 0.1428;
  Container? lessgo(int? index) {
    if (index == 1 && questions <= 5 && blocknanswers == true) {
      return Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.shade500,
              onPrimary: Colors
                  .white, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states

              shadowColor: Colors.black,
              elevation: 4.0,

              minimumSize: Size(20, 40),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0)),
              enabledMouseCursor: MouseCursor.defer,

              visualDensity: VisualDensity(horizontal: 0.0, vertical: 0.0),
              tapTargetSize: MaterialTapTargetSize.padded,
            ),
            onPressed: () {
              setState(() {
                blocknanswers = false;
                index = 0;
                color1 = Colors.blueGrey;
                color2 = Colors.blueGrey;
                color3 = Colors.blueGrey;
                color4 = Colors.blueGrey;
                pickRandomQuestion();
                questions++;
                lenearindicator = lenearindicator + 0.1428;
              });
            },
            child: Text("Next")),
      );
    } else {
      return Container(
        child: Text(""),
      );
    }
  }

  bool blocknanswers = false;
  int? g;
  Color color2 = Colors.blueGrey;
  Color color1 = Colors.blueGrey;
  Color color3 = Colors.blueGrey;
  Color color4 = Colors.blueGrey;
  bool? selectedindex;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Row(
          children: [
            Vatar(
                i: 1,
                coloravatar: questions >= 0
                    ? coloravatar1
                    : Colors.grey.withOpacity(0.4)),
            Spacer(),
            Vatar(
                i: 2,
                coloravatar: questions >= 1
                    ? coloravatar2
                    : Colors.grey.withOpacity(0.4)),
            Spacer(),
            Vatar(
                i: 3,
                coloravatar: questions >= 2
                    ? coloravatar3
                    : Colors.grey.withOpacity(0.4)),
            Spacer(),
            Vatar(
                i: 4,
                coloravatar: questions >= 3
                    ? coloravatar4
                    : Colors.grey.withOpacity(0.4)),
            Spacer(),
            Vatar(
                i: 5,
                coloravatar: questions >= 4
                    ? coloravatar5
                    : Colors.grey.withOpacity(0.4)),
            Spacer(),
            Vatar(
                i: 6,
                coloravatar: questions >= 5
                    ? coloravatar6
                    : Colors.grey.withOpacity(0.4)),
            Spacer(),
            Vatar(
                i: 7,
                coloravatar: questions >= 6
                    ? coloravatar7
                    : Colors.grey.withOpacity(0.4)),
            Spacer(),
          ],
        ),
      ),
      const Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(
              Color(0xFF0072FF),
            ),
            minHeight: 3,
            value: 0.14,
          )),
      Padding(
        padding: const EdgeInsets.only(top: 10, right: 15, left: 30),
        child: Center(
          child: Text(
            AppBrain().getRandomQuestion(randomindex),
            style: TextStyle(
                color: black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Column(
        children: [
          GestureDetector(
            onTap: blocknanswers == true
                ? null
                : () {
                    setState(() {
                      blocknanswers = true;
                      if (AppBrain().getOptionanswer0(randomindex) == true) {
                        color1 = Colors.green;
                      } else if (AppBrain().getOptionanswer0(randomindex) ==
                          false) {
                        color1 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer1(randomindex) == true) {
                        color2 = Colors.green;
                      } else if (AppBrain().getOptionanswer1(randomindex) ==
                          false) {
                        color2 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer2(randomindex) == true) {
                        color3 = Colors.green;
                      } else if (AppBrain().getOptionanswer2(randomindex) ==
                          false) {
                        color3 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer3(randomindex) == true) {
                        color4 = Colors.green;
                      } else if (AppBrain().getOptionanswer3(randomindex) ==
                          false) {
                        color4 = Colors.red;
                      }
                      g = 1;
                      if (questions == 0) {
                        if (AppBrain().getOptionanswer0(randomindex) == true) {
                          coloravatar1 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar1 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 1) {
                        if (AppBrain().getOptionanswer0(randomindex) == true) {
                          coloravatar2 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar2 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 2) {
                        if (AppBrain().getOptionanswer0(randomindex) == true) {
                          coloravatar3 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar3 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 3) {
                        if (AppBrain().getOptionanswer0(randomindex) == true) {
                          coloravatar4 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar4 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 4) {
                        if (AppBrain().getOptionanswer0(randomindex) == true) {
                          coloravatar5 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar5 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 5) {
                        if (AppBrain().getOptionanswer0(randomindex) == true) {
                          coloravatar6 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar6 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 6) {
                        if (AppBrain().getOptionanswer0(randomindex) == true) {
                          coloravatar7 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar7 = Colors.red;
                          nocorrect++;
                        }
                      }

                      print(questions);
                    });
                  },
            child: SizedBox(
              width: 350,
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: color1, // set the background color of the card
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                        child: Text(
                      AppBrain().getOption0(randomindex),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  )),
            ),
          ),
          GestureDetector(
            onTap: blocknanswers == true
                ? null
                : () {
                    setState(() {
                      blocknanswers = true;
                      if (AppBrain().getOptionanswer0(randomindex) == true) {
                        color1 = Colors.green;
                        color2 = Colors.red;
                        color3 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer0(randomindex) ==
                          false) {
                        color1 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer1(randomindex) == true) {
                        color2 = Colors.green;
                        color1 = Colors.red;
                        color3 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer1(randomindex) ==
                          false) {
                        color2 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer2(randomindex) == true) {
                        color3 = Colors.green;
                        color1 = Colors.red;
                        color2 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer2(randomindex) ==
                          false) {
                        color3 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer3(randomindex) == true) {
                        color4 = Colors.green;
                        color1 = Colors.red;
                        color2 = Colors.red;
                        color3 = Colors.red;
                      } else if (AppBrain().getOptionanswer3(randomindex) ==
                          false) {
                        color4 = Colors.red;
                      }
                      g = 1;
                      if (questions == 0) {
                        if (AppBrain().getOptionanswer1(randomindex) == true) {
                          coloravatar1 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar1 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 1) {
                        if (AppBrain().getOptionanswer1(randomindex) == true) {
                          coloravatar2 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar2 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 2) {
                        if (AppBrain().getOptionanswer1(randomindex) == true) {
                          coloravatar3 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar3 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 3) {
                        if (AppBrain().getOptionanswer1(randomindex) == true) {
                          coloravatar4 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar4 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 4) {
                        if (AppBrain().getOptionanswer1(randomindex) == true) {
                          coloravatar5 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar5 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 5) {
                        if (AppBrain().getOptionanswer1(randomindex) == true) {
                          coloravatar6 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar6 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 6) {
                        if (AppBrain().getOptionanswer1(randomindex) == true) {
                          coloravatar7 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar7 = Colors.red;
                          nocorrect++;
                        }
                      }
                    });
                  },
            child: SizedBox(
              width: 350,
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: color2,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                        child: Text(
                      AppBrain().getOption1(randomindex),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  )),
            ),
          ),
          GestureDetector(
            onTap: blocknanswers == true
                ? null
                : () {
                    setState(() {
                      blocknanswers = true;
                      if (AppBrain().getOptionanswer0(randomindex) == true) {
                        color1 = Colors.green;
                        color2 = Colors.red;
                        color3 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer0(randomindex) ==
                          false) {
                        color1 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer1(randomindex) == true) {
                        color2 = Colors.green;
                        color1 = Colors.red;
                        color3 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer1(randomindex) ==
                          false) {
                        color2 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer2(randomindex) == true) {
                        color3 = Colors.green;
                        color1 = Colors.red;
                        color2 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer2(randomindex) ==
                          false) {
                        color3 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer3(randomindex) == true) {
                        color4 = Colors.green;
                        color1 = Colors.red;
                        color2 = Colors.red;
                        color3 = Colors.red;
                      } else if (AppBrain().getOptionanswer3(randomindex) ==
                          false) {
                        color4 = Colors.red;
                      }
                      g = 1;
                      if (questions == 0) {
                        if (AppBrain().getOptionanswer2(randomindex) == true) {
                          coloravatar1 = Colors.green;
                        } else {
                          coloravatar1 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 1) {
                        if (AppBrain().getOptionanswer2(randomindex) == true) {
                          coloravatar2 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar2 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 2) {
                        if (AppBrain().getOptionanswer2(randomindex) == true) {
                          coloravatar3 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar3 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 3) {
                        if (AppBrain().getOptionanswer2(randomindex) == true) {
                          coloravatar4 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar4 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 4) {
                        if (AppBrain().getOptionanswer2(randomindex) == true) {
                          coloravatar5 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar5 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 5) {
                        if (AppBrain().getOptionanswer2(randomindex) == true) {
                          coloravatar6 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar6 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 6) {
                        if (AppBrain().getOptionanswer2(randomindex) == true) {
                          coloravatar7 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar7 = Colors.red;
                          nocorrect++;
                        }
                      }
                    });
                  },
            child: SizedBox(
              width: 350,
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: color3,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                        child: Text(
                      AppBrain().getOption2(randomindex),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  )),
            ),
          ),
          GestureDetector(
            onTap: blocknanswers == true
                ? null
                : () {
                    setState(() {
                      blocknanswers = true;
                      if (AppBrain().getOptionanswer0(randomindex) == true) {
                        color1 = Colors.green;
                        color2 = Colors.red;
                        color3 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer0(randomindex) ==
                          false) {
                        color1 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer1(randomindex) == true) {
                        color2 = Colors.green;
                        color1 = Colors.red;
                        color3 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer1(randomindex) ==
                          false) {
                        color2 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer2(randomindex) == true) {
                        color3 = Colors.green;
                        color1 = Colors.red;
                        color2 = Colors.red;
                        color4 = Colors.red;
                      } else if (AppBrain().getOptionanswer2(randomindex) ==
                          false) {
                        color3 = Colors.red;
                      }
                      if (AppBrain().getOptionanswer3(randomindex) == true) {
                        color4 = Colors.green;
                        color1 = Colors.red;
                        color2 = Colors.red;
                        color3 = Colors.red;
                      } else if (AppBrain().getOptionanswer3(randomindex) ==
                          false) {
                        color4 = Colors.red;
                      }
                      g = 1;
                      if (questions == 0) {
                        if (AppBrain().getOptionanswer3(randomindex) == true) {
                          coloravatar1 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar1 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 1) {
                        if (AppBrain().getOptionanswer3(randomindex) == true) {
                          coloravatar2 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar2 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 2) {
                        if (AppBrain().getOptionanswer3(randomindex) == true) {
                          coloravatar3 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar3 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 3) {
                        if (AppBrain().getOptionanswer3(randomindex) == true) {
                          coloravatar4 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar4 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 4) {
                        if (AppBrain().getOptionanswer3(randomindex) == true) {
                          coloravatar5 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar5 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 5) {
                        if (AppBrain().getOptionanswer3(randomindex) == true) {
                          coloravatar6 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar6 = Colors.red;
                          nocorrect++;
                        }
                      }
                      if (questions == 6) {
                        if (AppBrain().getOptionanswer3(randomindex) == true) {
                          coloravatar7 = Colors.green;
                          correctanswers++;
                        } else {
                          coloravatar7 = Colors.red;
                          nocorrect++;
                        }
                      }
                    });
                  },
            child: SizedBox(
              width: 350,
              child: Card(
                  elevation: 4, // set the elevation (drop shadow) of the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        16), // set the border radius of the card
                  ),
                  color: color4,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                        child: Text(
                      AppBrain().getOption3(randomindex),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  )),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          lessgo(g)!,
          Container(
            child: questions >= 6 && correctanswers > nocorrect
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("Winnerpage");
                    },
                    child: Text("next"))
                : questions >= 6 && correctanswers < nocorrect
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("Looser");
                        },
                        child: Text("next"))
                    : null,
          )
        ],
      )
    ]);
  }
}

class Vatar extends StatelessWidget {
  int i;
  Color coloravatar;
  Vatar({
    Key? key,
    required this.i,
    required this.coloravatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: coloravatar,
      child: Text(
        "$i",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
