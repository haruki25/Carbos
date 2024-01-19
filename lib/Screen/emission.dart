import 'package:carbo/Models/Tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
  @override
  Widget build(BuildContext context) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    double screenlen = MediaQuery.of(context).size.height;
    double screenwid = MediaQuery.of(context).size.width;
    if (total == 0)
      widget.map['${months[counter]}']!.forEach((element) {
        total += double.parse(element);
      });
    void _updatetotal(double a) {
      a = (a*10).round()/10;
      setState(() {
        total += a;
      });
    }
    Key _chartKey = GlobalKey();

    Map<String, double> datamap = {
      "purchase": double.parse(widget.map['${months[counter]}']![0]),
      "Petrol": double.parse(widget.map['${months[counter]}']![1]),
      "Electricity": double.parse(widget.map['${months[counter]}']![2]),
      "Food": double.parse(widget.map['${months[counter]}']![3])
    };
    List<Color> colorList = [
      Colors.green[100]!,
      Colors.brown[500]!,
      Colors.green[500]!,
      Colors.brown[300]!,
    ];
    return Container(
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
                  centerText: "${(total*10).round()/10}",
                  chartRadius: screenwid * 0.4,
                  chartValuesOptions:
                      ChartValuesOptions(showChartValues: false),
                  chartType: ChartType.ring,
                  ringStrokeWidth: 24,
                ),
              )
            ]),
          ),
          Container(
            height: screenlen * 0.6,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Hero(
              tag: 'hero-tag',
              child: Container(
                height: 300,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(screenwid * 0.05),
                      leading: InkWell(
                        onTap: () {
                          if (counter != 0)
                            setState(() {
                              counter--;
                              print(counter);
                            });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/icon/left.png',
                            height: 30,
                          ),
                        ),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          if (counter != 11)
                            setState(() {
                              counter++;
                              print(counter);
                            });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/icon/right.png',
                            height: 30,
                          ),
                        ),
                      ),
                      title: TextButton(
                        onPressed: () {},
                        child: Text(
                          "${months[counter]} 2023",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Tile(
                                updatetotal:_updatetotal,
                                tag: '${months[counter]}',
                                data: widget.map['${months[counter]}']!,
                                check: counter == now.month - 1,
                                title: "purchase",
                                carbon: double.parse(
                                    widget.map['${months[counter]}']![0]),
                                icon: 'assets/icon/Group.png'),
                            Tile(
                                updatetotal:_updatetotal,
                                tag: '${months[counter]}',
                                data: widget.map['${months[counter]}']!,
                                check: counter == now.month - 1,
                                title: 'Petrol',
                                carbon: double.parse(
                                    widget.map['${months[counter]}']![1]),
                                icon: 'assets/icon/Vector.png'),
                            Tile(
                                updatetotal:_updatetotal,
                                tag: '${months[counter]}',
                                data: widget.map['${months[counter]}']!,
                                check: counter == now.month - 1,
                                title: 'Electricity',
                                carbon: double.parse(
                                    widget.map['${months[counter]}']![2]),
                                icon: 'assets/icon/electric.png'),
                            Tile(
                                updatetotal:_updatetotal,
                                tag: '${months[counter]}',
                                data: widget.map['${months[counter]}']!,
                                check: counter == now.month - 1,
                                title: "Food",
                                carbon: double.parse(
                                    widget.map['${months[counter]}']![3]),
                                icon: 'assets/icon/food.png'),
                            SizedBox(height: 100),
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
  }
}
