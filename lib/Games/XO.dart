import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_finance_app/data/Xodata.dart';
import 'package:flutter_finance_app/theme/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:mix/mix.dart';

class XOgame extends StatefulWidget {
  const XOgame({super.key});

  @override
  State<XOgame> createState() => _XOgameState();
}

class _XOgameState extends State<XOgame> {
  int games = 0;
  String textmsg = "next game ";
  int countx = 0;
  int county = 0;
  String player = "X";
  Gamedata game = new Gamedata();
  bool finishedgame = false;
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  int turn = 0;
  String result = "";
  @override
  void initState() {
    game.board = Gamedata.initGameBoard();
    super.initState();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                child: Text(
                  "it's ${player} turn ".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: boardwidth,
                height: boardwidth,
                child: GridView.count(
                  padding: EdgeInsets.all(16),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: Gamedata.boardlenth ~/ 3,
                  children: List.generate(Gamedata.boardlenth, (index) {
                    return InkWell(
                      onTap: finishedgame
                          ? null
                          : () {
                              if (game.board![index] == "") {
                                setState(() {
                                  game.board![index] = player;
                                  turn++;
                                  finishedgame = game.winnerCheck(
                                      player, index, scoreboard, 3);

                                  if (finishedgame && games <= 2) {
                                    result = "$player is the winner";
                                    if (player == "X") {
                                      countx++;
                                      games++;
                                    }
                                    if (player == "O") {
                                      county++;
                                      games++;
                                    }
                                    if (countx >= 2) {
                                      result = "$player won the stickers";
                                      Navigator.of(context)
                                          .pushReplacementNamed("Winnerpage");
                                    }
                                    if (county >= 2) {
                                      result = "$player won the stickers ";
                                      Navigator.of(context)
                                          .pushReplacementNamed("loseXo");
                                    }
                                  } else if (!finishedgame && turn == 9) {
                                    result = "Draw";
                                    print(!finishedgame);
                                    finishedgame = true;
                                  }
                                  if (player == "X") {
                                    player = 'O';
                                  } else {
                                    player = "X";
                                  }
                                  print(game.board);
                                  print(result);
                                });
                              }
                            },
                      child: Container(
                        width: Gamedata.blocsize,
                        height: Gamedata.blocsize,
                        decoration: BoxDecoration(
                            color: arrowbgColor,
                            borderRadius: BorderRadius.circular(14)),
                        child: Center(
                          child: Text(
                            game.board![index],
                            style: TextStyle(
                                color: game.board![index] == "X"
                                    ? Colors.blue
                                    : Colors.pink,
                                fontSize: 64),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                result,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Container(
                child: finishedgame == false || county == 2 || countx == 2
                    ? null
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          setState(() {
                            game.board = Gamedata.initGameBoard();
                            finishedgame = false;
                            turn = 0;
                            result = "";
                            scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                          });
                        },
                        child: Text(textmsg)),
              ),
              Container()
            ],
          ),
        ],
      ),
    );
  }
}
