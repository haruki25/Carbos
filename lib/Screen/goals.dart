import 'dart:math';

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:carbo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Models/Tiles.dart';

class GoalsScreen extends StatefulWidget {
  List<String> goal;

  GoalsScreen({required this.goal});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

double total = 0.0;

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenlen = MediaQuery.of(context).size.height;

    double screenwid = MediaQuery.of(context).size.width;
    if (total == 0)
      widget.goal.forEach((element) {
        total += double.parse(element);
      });
    void _updatetotal(double a) {
      a = (a * 10).round() / 10;
      setState(() {
        total += a;
      });
    }

    Map<String, double> datamap = {
      "purchase": double.parse(widget.goal[0]),
      "Petrol": double.parse(widget.goal[1]),
      "Electricity": double.parse(widget.goal[2]),
      "Food": double.parse(widget.goal[3])
    };
    List<Color> colorList = [
      Colors.green[100]!,
      Colors.brown[500]!,
      Colors.green[500]!,
      Colors.brown[300]!,
    ];

    Key _chartKey = GlobalKey();
    Widget active = screenlen > screenwid
        ? Container(
            height: screenlen,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: screenlen,
                  width: double.infinity,
                  color: Colors.green[300],
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PieChart(
                        key: _chartKey,
                        dataMap: datamap,
                        colorList: colorList,
                        centerText: "${(total * 10).round() / 10}",
                        chartRadius: max(screenlen * 0.2, screenwid * 0.35),
                        chartValuesOptions:
                        ChartValuesOptions(showChartValues: false),
                        chartType: ChartType.ring,
                        ringStrokeWidth: 24,
                      ),
                    ),
                  ]),
                ),
                Container(
                  height: screenlen * 0.75 < screenwid
                      ? screenlen * 0.5
                      : screenlen * 0.6,
                  width: screenlen < screenwid ? screenwid * 0.5 : screenwid,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Container(
                    height: screenlen * 0.4,
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(screenwid * 0.05),
                          title: Center(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "${(total * 10).round() / 10} ton C02/yr",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Tile(
                                    updatetotal: _updatetotal,
                                    tag: 'goal',
                                    data: widget.goal,
                                    title: "purchase",
                                    carbon: double.parse(widget.goal[0]),
                                    icon: 'assets/icon/Group.png'),
                                Tile(
                                    updatetotal: _updatetotal,
                                    tag: 'goal',
                                    data: widget.goal,
                                    title: 'Petrol',
                                    carbon: double.parse(widget.goal[1]),
                                    icon: 'assets/icon/Vector.png'),
                                Tile(
                                    updatetotal: _updatetotal,
                                    tag: 'goal',
                                    data: widget.goal,
                                    title: 'Electricity',
                                    carbon: double.parse(widget.goal[2]),
                                    icon: 'assets/icon/electric.png'),
                                Tile(
                                    updatetotal: _updatetotal,
                                    tag: 'goal',
                                    data: widget.goal,
                                    title: "Food",
                                    carbon: double.parse(widget.goal[3]),
                                    icon: 'assets/icon/food.png'),
                                SizedBox(height: screenlen * 0.08),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : Container(
            color: Colors.green[300],
            child: Row(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20, 20, screenlen * 0.1),
                    child: PieChart(
                      key: _chartKey,
                      dataMap: datamap,
                      colorList: colorList,
                      centerText: "${(total * 10).round() / 10}",
                      chartRadius: max(screenlen * 0.2, screenwid * 0.25),
                      chartValuesOptions:
                          ChartValuesOptions(showChartValues: false),
                      chartType: ChartType.ring,
                      ringStrokeWidth: 24,
                      legendOptions:
                          LegendOptions(legendPosition: LegendPosition.bottom),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: screenlen,
                    width: screenwid * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Container(
                      height: screenlen * 0.4,
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(screenwid * 0.05),
                            title: Center(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "${(total * 10).round() / 10} ton C02/yr",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Tile(
                                      updatetotal: _updatetotal,
                                      tag: 'goal',
                                      data: widget.goal,
                                      title: "purchase",
                                      carbon: double.parse(widget.goal[0]),
                                      icon: 'assets/icon/Group.png'),
                                  Tile(
                                      updatetotal: _updatetotal,
                                      tag: 'goal',
                                      data: widget.goal,
                                      title: 'Petrol',
                                      carbon: double.parse(widget.goal[1]),
                                      icon: 'assets/icon/Vector.png'),
                                  Tile(
                                      updatetotal: _updatetotal,
                                      tag: 'goal',
                                      data: widget.goal,
                                      title: 'Electricity',
                                      carbon: double.parse(widget.goal[2]),
                                      icon: 'assets/icon/electric.png'),
                                  Tile(
                                      updatetotal: _updatetotal,
                                      tag: 'goal',
                                      data: widget.goal,
                                      title: "Food",
                                      carbon: double.parse(widget.goal[3]),
                                      icon: 'assets/icon/food.png'),
                                  SizedBox(height: screenlen * 0.08),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
    return active;
  }
}
