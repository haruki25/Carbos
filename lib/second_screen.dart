import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:carbo/Screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen/LeaderBoard.dart';
import 'Screen/emission.dart';
import 'Screen/goals.dart';

class SecondScreen extends StatefulWidget {
  Map<String, List<String>> map;

  List<String> goal;

  SecondScreen({required this.map, required this.goal});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  int value = 0;
  String text = "My Foot Print";

  Widget build(BuildContext context) {
    double screenlen = MediaQuery.of(context).size.height;

    double screenwid = MediaQuery.of(context).size.width;
    Widget active = AnimatedSizeAndFade(
        fadeDuration: Duration(milliseconds: 700),
        child: value == 0
            ? HomeScreen(map: widget.map)
            : value == 1
                ? LeaderBoardScreen()
                : value == 2
                    ? EmissionScreen(map: widget.map)
                    : GoalsScreen(goal: widget.goal));
    return Scaffold(
      backgroundColor:
          value == 2 || value == 3 ? Colors.green[100] : Colors.green[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenlen*0.08),
        child: AppBar(
          backgroundColor: value == 1 || value == 0
              ? Color.fromRGBO(94, 140, 97, 100)
              : Colors.green[300],
          title: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Stack(
        children: [
          active,
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenlen*0.025,),
                  child: Container(
                    height: screenlen * 0.08,
                    width: double.infinity,
                    color: Colors.brown[900],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = 0;
                              text = "My Foot Print";
                            });
                          },
                          icon: Image.asset('assets/Home.png',
                              height: screenlen * 0.025),
                          color: Colors.green[200],
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = 1;
                              text = "LeaderBoard";
                            });
                          },
                          icon: Image.asset(
                            'assets/Leaderbord.png',
                            height: screenlen * 0.025,
                            width: screenwid * 0.1,
                          ),
                          color: Colors.green[200],
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = 2;
                              text = "Emission";
                            });
                          },
                          icon: Image.asset(
                            'assets/Emissions.png',
                            height: screenlen * 0.025,
                            width: screenwid * 0.1,
                          ),
                          color: Colors.green[200],
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = 3;
                              text = "Goals";
                            });
                          },
                          icon: Image.asset('assets/Goal.png',
                              width: screenwid * 0.1,
                              height: screenlen * 0.025),
                          color: Colors.green[200],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: screenlen * 0.05 < screenwid * 0.1
                        ? screenlen * 0.05
                        : screenwid * 0.1,
                    width: screenwid * 0.1 < screenlen * 0.05
                        ? screenwid * 0.1
                        : screenlen * 0.05,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            spreadRadius: 7,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromRGBO(90, 160, 97, 100)),
                    child: Center(
                        child: Image.asset('assets/Search.png',
                            height: screenlen * 0.025))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
