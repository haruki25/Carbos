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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenlen * 0.08),
        child: AppBar(
          backgroundColor: value == 1 || value == 0
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primaryContainer,
          title: value == 0
              ? Text(text, style: TextStyle(color: Colors.white))
              : Center(
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(text,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)))),
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
                  padding: EdgeInsets.only(
                    top: screenlen * 0.025,
                  ),
                  child: Container(
                    height: screenlen * 0.08,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.tertiary,
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
                          icon: Icon(Icons.home, size: screenlen * 0.032),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = 1;
                              text = "LeaderBoard";
                            });
                          },
                          icon: Icon(
                            Icons.leaderboard,
                            size: screenlen * 0.032,
                          ),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = 2;
                              text = "Emission";
                            });
                          },
                          icon: Icon(
                            Icons.co2,
                            size: screenlen * 0.04,
                          ),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = 3;
                              text = "Goals";
                            });
                          },
                          icon: Icon(Icons.task_alt, size: screenlen * 0.032),
                          color: Theme.of(context).colorScheme.primaryContainer,
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
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        color: Theme.of(context).colorScheme.tertiary),
                    child: Center(
                        child: Icon(
                      Icons.search,
                      size: screenlen * 0.032,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
