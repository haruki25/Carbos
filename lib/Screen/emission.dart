import 'dart:math';

import 'package:carbo/Models/Tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:carbo/Data/data.dart';
import 'package:carbo/Data/data.dart';
class EmissionScreen extends StatefulWidget {
  Map<String, List<String>> map;

  EmissionScreen({required this.map});

  @override
  State<EmissionScreen> createState() => _EmissionScreenState();
}

bool isvalue = false;
double total = 0;

DateTime now = DateTime.now();
int counter = now.month - 1;

class _EmissionScreenState extends State<EmissionScreen> {
  void _updatetotal(double a) {
    a = (a * 10).round() / 10;
    setState(() {
      total += a;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenlen = MediaQuery.of(context).size.height;
    double screenwid = MediaQuery.of(context).size.width;
    if (total == 0)
      widget.map['${months[counter]}']!.forEach((element) {
        total += double.parse(element);
      });

    Key _chartKey = GlobalKey();

    Map<String, double> datamap = {
      "Purchase": double.parse(widget.map['${months[counter]}']![0]),
      "Petrol": double.parse(widget.map['${months[counter]}']![1]),
      "Electricity": double.parse(widget.map['${months[counter]}']![2]),
      "Food": double.parse(widget.map['${months[counter]}']![3])
    };
    Widget active = Container(
            height: screenlen,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                    children: [
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
                Container(
                  height: screenlen * 0.75 < screenwid
                      ? screenlen * 0.5
                      : screenlen * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Container(
                    height: screenlen * 0.4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(screenwid * 0.05),
                          leading: InkWell(
                            onTap: () {
                              if (counter != 0) {
                                int i = counter - 1;
                                double temp = 0;
                                widget.map['${months[i]}']!
                                    .forEach((element) {
                                  temp += double.parse(element);
                                });
                                setState(() {
                                  counter--;
                                  total = temp;
                                });
                              }
                            },
                            child: Icon(Icons.chevron_left,size: 30,)
                          ),
                          trailing: InkWell(
                            onTap: () {
                              if (counter != 11) {
                                int i = counter + 1;
                                double temp = 0;
                                widget.map['${months[i]}']!
                                    .forEach((element) {
                                  temp += double.parse(element);
                                });
                                setState(() {
                                  counter++;
                                  total = temp;
                                });
                              }
                            },
                            child: Icon(Icons.chevron_right,size: 30,)
                          ),
                          title: TextButton(
                            onPressed: () {},
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "${months[counter]} 2024",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 25),
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
                                    tag: '${months[counter]}',
                                    data: widget.map['${months[counter]}']!,
                                    check: counter == now.month - 1,
                                    title: "Purchase",
                                    carbon: double.parse(
                                        widget.map['${months[counter]}']![0]),
                                    icon: Icons.local_mall),
                                Tile(
                                    updatetotal: _updatetotal,
                                    tag: '${months[counter]}',
                                    data: widget.map['${months[counter]}']!,
                                    check: counter == now.month - 1,
                                    title: 'Petrol',
                                    carbon: double.parse(
                                        widget.map['${months[counter]}']![1]),
                                    icon: Icons.local_gas_station),
                                Tile(
                                    updatetotal: _updatetotal,
                                    tag: '${months[counter]}',
                                    data: widget.map['${months[counter]}']!,
                                    check: counter == now.month - 1,
                                    title: 'Electricity',
                                    carbon: double.parse(
                                        widget.map['${months[counter]}']![2]),
                                    icon: Icons.electric_bolt),
                                Tile(
                                    updatetotal: _updatetotal,
                                    tag: '${months[counter]}',
                                    data: widget.map['${months[counter]}']!,
                                    check: counter == now.month - 1,
                                    title: "Food",
                                    carbon: double.parse(
                                        widget.map['${months[counter]}']![3]),
                                    icon: Icons.lunch_dining),
                                SizedBox(height: screenlen * 0.1),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ));
    return active;
  }
}
