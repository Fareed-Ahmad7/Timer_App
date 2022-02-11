import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(const CountUp());
}
class CountUp extends StatefulWidget {
  const CountUp({Key? key}) : super(key: key);

  @override
  _CountUpState createState() => _CountUpState();
}

class _CountUpState extends State<CountUp> {
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void addTime() {
    final addSeconds = 1;

    setState(() {
      final SECONDS = duration.inSeconds + addSeconds;

      duration = Duration(seconds: SECONDS); 
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Welcome to Flutter'
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: buildTime(),
        ),
      ),
    );
  }

  buildTime() {
    // if 9 --> 09
    // if 11 --> 11

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));


    return Text(
      '$minutes:$seconds',
      style: TextStyle(fontSize: 80 ),
    );
  }
}
