import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Map<String, List<String>> map;

  HomeScreen({required this.map});

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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          bottom: screenlen*0.447,
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.blue,
                ),
            child: ClipOval(
              child: Container(
                color: Color.fromRGBO(94, 140, 97, 100),
                // Adjust the color as needed
                width: screenwid,
                height: screenlen*0.95,
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
                  "   ${(carbon*10).round()/10}",
                  style: TextStyle(fontSize: screenlen*0.0667,color: Colors.white),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: screenlen *0.016),
                  child: Text("  ton CO2/year",
                      style: TextStyle(fontSize: screenlen*0.02668,color: Colors.white)),
                )
              ],
            ),
            SizedBox(height: screenlen*0.025,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: screenwid *0.1),
                  child: Container(height:screenlen*0.05,child: Image.asset('assets/icon/Chart.png',),),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenlen*0.01,left: screenwid *0.05),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("+5% from last Month",
                        style: TextStyle(
                            fontFamily: 'Roboto',fontWeight: FontWeight.w100,color: Colors.white)
                    ),
                  ),
                )
              ],
            ),
            Container(height: screenlen*0.26,width : screenwid*0.85,child: Image.asset('assets/icon/graph.png'),),
            SizedBox(height: screenlen*0.025,),
            Container(
              height: screenlen*0.35,
              width: screenwid*0.7,
              child: Image.asset('assets/plant.png'),
            ),
          ],
        ),
      ],
    );
  }
}
