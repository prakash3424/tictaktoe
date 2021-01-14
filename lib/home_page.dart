import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  String message;
  List<String> gameState;
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage edit = AssetImage("images/edit.png");

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

//reset
  reset() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

//link images
  AssetImage getImage(String value) {
    switch (value) {
      case 'empty':
        return edit;
        break;
      case 'cross':
        return cross;
        break;
      case 'circle':
        return circle;
        break;
    }
  }
//play the game

  play(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = 'cross';
        } else {
          this.gameState[index] = 'circle';
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

//winlogic
  checkWin() {
    if ((this.gameState[0] != 'empty') &&
        (this.gameState[0] == this.gameState[1]) &&
        (this.gameState[1] == this.gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins!!';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    } else if ((this.gameState[3] != 'empty') &&
        (this.gameState[3] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} Wins!!';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    } else if ((this.gameState[6] != 'empty') &&
        (this.gameState[6] == this.gameState[7]) &&
        (this.gameState[7] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} Wins!!';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    } else if ((this.gameState[0] != 'empty') &&
        (this.gameState[0] == this.gameState[3]) &&
        (this.gameState[3] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins!!';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    } else if ((this.gameState[1] != 'empty') &&
        (this.gameState[1] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[7])) {
      setState(() {
        this.message = '${this.gameState[4]} Wins!!';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    } else if ((this.gameState[2] != 'empty') &&
        (this.gameState[2] == this.gameState[5]) &&
        (this.gameState[5] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} Wins!!';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    } else if ((this.gameState[0] != 'empty') &&
        (this.gameState[0] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} Wins!!';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    } else if ((this.gameState[6] != 'empty') &&
        (this.gameState[6] == this.gameState[4]) &&
        (this.gameState[4] == this.gameState[2])) {
      setState(() {
        this.message = '${this.gameState[6]} Wins!!';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = 'Draw';
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            this.reset();
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe!!!!!!!'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(40.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    play(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          MaterialButton(
            onPressed: () {
              this.reset();
            },
            color: Colors.purple,
            splashColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              'RESET',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'WE THE BEST MUSIC',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
