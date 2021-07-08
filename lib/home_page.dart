import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/customdialog.dart';
import 'package:tictactoe/gamebutton.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<Gamebutton> buttonlist;
  var player1;
  var player2;
  var score1 =  0;
  var score2 = 0 ;
  var flag = 1;
  var activeplayer;

  static const color = Colors.white70;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonlist = doInit();
  }

  List<Gamebutton> doInit() {
    player1 = [];
    player2 = [];
    activeplayer = 1;

    var gameButtons = <Gamebutton>[
      new Gamebutton(id: 1),
      new Gamebutton(id: 2),
      new Gamebutton(id: 3),
      new Gamebutton(id: 4),
      new Gamebutton(id: 5),
      new Gamebutton(id: 6),
      new Gamebutton(id: 7),
      new Gamebutton(id: 8),
      new Gamebutton(id: 9),
    ];
    return gameButtons;
  }

  void gameplay(Gamebutton bt){
    setState(() {
      if(activeplayer == 1) {
        bt.text = "x";
        bt.bg= Colors.red;
        activeplayer = 2;
        player1.add(bt.id);
      }
      else{
        bt.text = "o";
        bt.bg= Colors.black;
        activeplayer = 1;
        player2.add(bt.id);
      }
      bt.enable=false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonlist.every((p) => p.text != "")) {
          showDialog(
            context: context,
            builder: (_) => new customdialog(title: "Game Tied", content: "Press the reset button to start again.",
              callback: (){ resetgame(); },
            ),
          );
        }
        // } else {
        //   activeplayer == 2 ? autoPlay() : null;
        // }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var list = new List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cellID = emptyCells[randIndex];
    int i = buttonlist.indexWhere((p)=> p.id == cellID);
    gameplay(buttonlist[i]);
  }


  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        score1 ++;
        showDialog(
            context: context,
            builder: (_) => new customdialog(title: "Player 1 Won", content: "Press the reset button to start again.",
              callback: (){ resetgame(); },
            ),
        );
      } else {
        score2 ++;
        showDialog(
          context: context,
          builder: (_) => new customdialog(title: "Player 2 Won", content: "Press the reset button to start again.",
              callback: (){ resetgame(); },
          ),
        );
      }
    }
    return winner;
  }
  void resetgame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonlist = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Nought & Cross ",
        style: TextStyle(
           color: Colors.orange.shade900,
          ),
         ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(onPressed: ()=> null,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange.shade900
                ),
                child: Text("P V P",
                 style: TextStyle(
                   color: color
                 ),
                ),
              ),
              // SizedBox(
              //   width: 20,
              // ),
              // TextButton(onPressed: ()=> null,
              //   style: TextButton.styleFrom(
              //       backgroundColor: Colors.orange.shade900
              //   ),
              //   child: Text("P V M",
              //     style: TextStyle(
              //         color: color
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                ),
                itemCount: buttonlist.length,
                itemBuilder: (context,index) => SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Theme.of(context)
                                .colorScheme
                                .primary;
                          else if (states.contains(MaterialState.disabled))
                            return buttonlist[index].bg;
                          return buttonlist[index].bg;
                        },
                      ),
                    ),
                    // disabledColor: buttonlist[index].bg,
                    onPressed: buttonlist[index].enable? ()=>gameplay(buttonlist[index]): null,
                    child: Text(buttonlist[index].text,style: TextStyle(
                        color: color,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Player 1 score :  $score1",style:
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                    fontSize: 14,
                  ),
                ),
                Text("Player 2 score :  $score2",style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            child: new Text(
              "Reset",
              style: new TextStyle(color: color, fontSize: 20.0),
            ),
            style: TextButton.styleFrom(
               padding:   EdgeInsets.all(20.0),
              backgroundColor: Colors.orange.shade900,
            ),
            onPressed: resetgame,
          ),
        ],
      ),
    );
  }
}
