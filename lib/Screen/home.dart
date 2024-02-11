import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:carbo/Data/data.dart';

class HomeScreen extends StatelessWidget {
  Map<String, List<String>> map;

  HomeScreen({required this.map});

  double sumListOfStrings(List<String> stringList) {
    double sum = 0;
    for (String str in stringList) {
      sum += double.tryParse(str) ??
          0; // Convert string to int, if conversion fails, default to 0
    }
    return (sum * 10).round() / 10;
  }

  @override
  Widget build(BuildContext context) {
    double screenlen = MediaQuery.of(context).size.height;
    double screenwid = MediaQuery.of(context).size.width;
    print('inside a widget ${screenlen}');
    double carbon = 0.0;

    map.forEach((key, value) {
      for (String item in value) {
        carbon += double.parse(item);
      }
    });

    int date = DateTime.now().month;
    date--;
    double prev = date == 0 ? 0 : sumListOfStrings(map[months[date - 1]]!);
    double gain = (prev -((sumListOfStrings(map[months[date]]!) ) /
                    (prev == 0 ? 1 : prev)) *
                10)
            .round() /
        10;

    int start = date;
    if (date >= 5)
      start = date - 5;
    else
      start = 0;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          bottom: screenlen * 0.447,
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.blue,
                ),
            child: ClipOval(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                // Adjust the color as needed
                width: screenwid,
                height: screenlen * 0.95,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "   ${(carbon * 10).round() / 10}",
                  style: TextStyle(
                      fontSize: screenlen * 0.0667, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenlen * 0.016),
                  child: Text("  ton CO2 till ${months[date]}",
                      style: TextStyle(
                          fontSize: screenlen * 0.02668, color: Colors.white)),
                )
              ],
            ),
            SizedBox(
              height: screenlen * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenwid * 0.1),
                  child: Container(
                    height: screenlen * 0.05,
                    child: Icon(
                      Icons.show_chart,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: screenlen * 0.01, left: screenwid * 0.01),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("${gain>0?"+":""}${gain}% from last Month",
                        style: TextStyle(
                            fontWeight: FontWeight.w100, color: Colors.white)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenlen * 0.025,
            ),
            Container(
              height: screenlen * 0.26,
              width: screenwid * 0.85,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        for (double i = 0; i < 5; i++)
                          FlSpot(
                              i,
                              sumListOfStrings(
                                  map[months[(i + start).toInt()]]!))
                        // FlSpot(1, 4),
                        // FlSpot(2, 2),
                        // FlSpot(3, 5),
                        // FlSpot(4, 3),
                      ],
                      // isCurved: true,
                      color: Theme.of(context).colorScheme.tertiary,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: true),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          if (value.ceil() == value) {
                            return Text(
                              months[(value + start).toInt()],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            );

                            // switch (value.toInt()) {
                            //   case 0:
                            //     return Text(
                            //       'Jan',
                            //       style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: Theme.of(context)
                            //               .colorScheme
                            //               .tertiary),
                            //     );
                            //   case 1:
                            //     return Text(
                            //       'Feb',
                            //       style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: Theme.of(context)
                            //               .colorScheme
                            //               .tertiary),
                            //     );
                            //   case 2:
                            //     return Text(
                            //       'Mar',
                            //       style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: Theme.of(context)
                            //               .colorScheme
                            //               .tertiary),
                            //     );
                            //   case 3:
                            //     return Text(
                            //       'April',
                            //       style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: Theme.of(context)
                            //               .colorScheme
                            //               .tertiary),
                            //     );
                            //   case 4:
                            //     return Text(
                            //       'May',
                            //       style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: Theme.of(context)
                            //               .colorScheme
                            //               .tertiary),
                            //     );
                            //   default:
                            //     return Text(
                            //       '',
                            //       style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: Theme.of(context)
                            //               .colorScheme
                            //               .tertiary),
                            //     );
                            // }
                          } else
                            return Text(
                              '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: screenlen * 0.35,
              width: screenwid * 0.7,
              child: Image.asset('assets/plant.png'),
            ),
          ],
        ),
      ],
    );
  }
}
