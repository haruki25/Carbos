import 'package:carbo/Screen/home.dart';
import 'package:carbo/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carbon Footprint Calculator',
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

Map<String, List<String>> mp = {
  'Jan': List.generate(4, (index) => '0.0'),
  'Feb': List.generate(4, (index) => '0.0'),
  'Mar': List.generate(4, (index) => '0.0'),
  'Apr': List.generate(4, (index) => '0.0'),
  'May': List.generate(4, (index) => '0.0'),
  'Jun': List.generate(4, (index) => '0.0'),
  'Jul': List.generate(4, (index) => '0.0'),
  'Aug': List.generate(4, (index) => '0.0'),
  'Sep': List.generate(4, (index) => '0.0'),
  'Oct': List.generate(4, (index) => '0.0'),
  'Nov': List.generate(4, (index) => '0.0'),
  'Dec': List.generate(4, (index) => '0.0'),
};
List<String> goal = List.generate(4, (index) => '0.0');

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    load_data();
    super.initState();
  }

  void load_data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < 12; i++) {
      final List<String>? items = prefs.getStringList('${months[i]}');
      if (items == null) {
        await prefs.setStringList(
            '${months[i]}', <String>['0.0', '0.0', '0.0', '0.0']);
      } else {
        mp['${months[i]}'] = items;
      }
    }
    final List<String>? goals = prefs.getStringList('goal');
    if (goals == null) {
      await prefs.setStringList('goal', <String>['0.0', '0.0', '0.0', '0.0']);
    } else {
      goal = goals;
    }
  }

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

    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          SizedBox(
            height: screenlen * 0.2,
          ),
          Container(
              height: 209,
              width: 209,
              child: Image.asset(
                'assets/carbonising.png',
              )),
          Text(
            'Track Your Carbon FootPrint',
            style: TextStyle(fontSize: 36),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenlen * 0.3,
          ),
          Container(
              height: 50,
              width: 155,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SecondScreen(map: mp, goal: goal);
                  }));
                },
                child: Hero(
                    tag: 'hero-tag',
                    child: Center(child: Image.asset('assets/Logo.png'))),
                splashColor: Color.fromRGBO(36, 58, 90, 100),
                borderRadius: BorderRadius.circular(10),
              ))
        ],
      ),
    );
  }
}
