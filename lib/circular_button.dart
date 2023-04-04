import 'package:flutter/material.dart';

class CircularButton extends StatefulWidget {
  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isOpen = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              setState(() {
                isOpen = !isOpen;
                if (isOpen) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        AnimatedContainer(
          height: isOpen ? 200 : 0,
          duration: Duration(milliseconds: 300),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
              ListTile(
                title: Text('Tips'),
                onTap: () {
                  Navigator.of(context).pushNamed('/tips');
                },
              ),
              ListTile(
                title: Text('Calculator'),
                onTap: () {
                  Navigator.of(context).pushNamed('/calculator');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
