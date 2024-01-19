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
          bottom: -screenlen * -0.3,
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.blue,
                ),
            child: ClipOval(
              child: Container(
                color: Color.fromRGBO(94, 140, 97, 100),
                // Adjust the color as needed
                width: screenwid,
                height: screenlen,
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
                  "   $carbon",
                  style: TextStyle(fontSize: 50,color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text("  ton CO2/year",
                      style: TextStyle(fontSize: 20,color: Colors.white)),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(height:35,child: Image.asset('assets/icon/Chart.png',),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5,left: 20),
                  child: Text("+5% from last Month",
                      style: TextStyle(
                          fontFamily: 'Roboto',fontWeight: FontWeight.w100,fontSize: 15,color: Colors.white)),
                )
              ],
            ),
            Container(height: 205,width : 300,child: Image.asset('assets/icon/graph.png'),),
            SizedBox(height: 20,),
            Container(
              height: 250,
              width: 250,
              child: Hero(
                  tag: 'hero-tag', // Use the same tag as in the FirstScreen
                  child: Image.asset('assets/plant.png')),
            ),
          ],
        ),
      ],
    );
  }
}
