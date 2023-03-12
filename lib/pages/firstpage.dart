import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_finance_app/theme/colors.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:rxdart/rxdart.dart';
import 'package:status_alert/status_alert.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  ScrollController? sc;
  var reward;
  final selected = BehaviorSubject<int>();
  @override
  void initState() {
    sc = new ScrollController();
    sc!.addListener(() {});
    super.initState();
  }

  List items = [
    "XO game",
    "Quiz Game",
    "XO game",
    "Quiz Game",
    "You Won a Sticker"
  ];
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
            controller: sc,
            child: Column(children: [
              Center(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
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
                                    height: 10,
                                  ),
                                  Image.asset(
                                    "images/game-console.png",
                                    width: 45,
                                  )
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
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                        primary: Colors.blue.shade500,
                        onPrimary: Colors
                            .white, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states

                        shadowColor: Colors.black,
                        elevation: 4.0,

                        minimumSize: Size(20, 40),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        enabledMouseCursor: MouseCursor.defer,

                        visualDensity:
                            VisualDensity(horizontal: 1.0, vertical: 1.0),
                        tapTargetSize: MaterialTapTargetSize.padded,
                      ),
                      onPressed: () {
                        sc!.animateTo(sc!.position.maxScrollExtent,
                            duration: Duration(seconds: 2),
                            curve: Curves.bounceIn);
                      },
                      child: Text(
                        "Let's Play",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 350,
              ),
              Row(
                children: [
                  Expanded(
                    child: Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.rotationZ(1.3), // Set the angle in radians
                      child: Center(
                        child: Image.asset(
                          "images/tic-tac-toe.png",
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.rotationZ(0.3), // Set the angle in radians
                      child: Center(
                        child: Image.asset(
                          "images/game-over.png",
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Text(
                "Swipingg".toUpperCase(),
                style: TextStyle(fontSize: 40),
              ),
              Icon(
                Icons.arrow_downward,
                size: 60,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(5.9),
                      child: Center(
                        child: Image.asset(
                          "images/game-console (1).png",
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.rotationZ(0.3), // Set the angle in radians
                      child: Center(
                        child: Image.asset(
                          "images/quiz.png",
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        child: FortuneWheel(
                          animateFirst: false,
                          selected: selected.stream,
                          items: [
                            for (int i = 0;
                                i < items.length;
                                i++) ...<FortuneItem>{
                              FortuneItem(child: Text(items[i].toString()))
                            }
                          ],
                          onAnimationEnd: () {
                            setState(() {
                              reward = items[selected.value];
                              if (reward == "Quiz Game" ||
                                  reward == "XO game") {
                                StatusAlert.show(
                                  context,
                                  duration: Duration(seconds: 2),
                                  title: reward,
                                  subtitle: "LET's Play!!",
                                  configuration:
                                      IconConfiguration(icon: Icons.games),
                                  maxWidth: 260,
                                );
                              } else {
                                StatusAlert.show(
                                  context,
                                  duration: Duration(seconds: 2),
                                  title: reward,
                                  subtitle: " Congratulation You Won !!",
                                  subtitleOptions: StatusAlertTextConfiguration(
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  configuration: IconConfiguration(
                                    icon: Icons.emoji_events_outlined,
                                  ),
                                  maxWidth: 260,
                                );
                              }
                            });
                            if (reward == "Quiz Game") {
                              Navigator.of(context)
                                  .pushReplacementNamed("quizapp");
                            }
                            if (reward == "XO game") {
                              Navigator.of(context)
                                  .pushReplacementNamed("Xogame ");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected.add(Fortune.randomInt(0, items.length));
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(horizontal: 90),
                          decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "SPINN",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 100,
              )
            ])));
  }
}
