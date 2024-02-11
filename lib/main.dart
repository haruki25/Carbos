import 'package:carbo/Screen/home.dart';
import 'package:carbo/Theme/theme.dart';
import 'package:carbo/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:carbo/Data/data.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
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
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
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



  @override
  Widget build(BuildContext context) {
    double screenlen = MediaQuery.of(context).size.height;
    print(screenlen);
    double screenwid = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        children: [
          SizedBox(
            height: screenlen * 0.2,
          ),
          Container(
              height: screenlen * 0.2,
              width: screenwid * 80,
              child: Image.asset(
                'assets/carbonising.png',
              )),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Track Your Carbon \n FootPrint',
              style: TextStyle(fontSize: screenlen * 0.04,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: screenlen * 0.3,
          ),
          Container(
              height: screenlen * 0.07,
              width: screenwid * 0.45,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context){
                    return SecondScreen(map: mp, goal: goal);
                  }));
                },
                child: Center(child: Image.asset('assets/Logo.png')),
                splashColor: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(10),
              ))
        ],
      ),
    );
  }
}
