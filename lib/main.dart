// import 'dart:ffi';
// import 'dart:html';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // startTimer();
  }

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      // color: Color.fromRGBO(7, 59, 76, 1),
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Welcome to Flutter'
      home: Scaffold(
        // backgroundColor: Color.fromRGBO(255, 112, 165, 1),
        backgroundColor: Colors.amber,
        appBar: AppBar(
          // backgroundColor: Color.fromRGBO(255, 112, 165, 1),
          backgroundColor: Colors.amber,
          elevation: 0.0,
          title: Text(
            'Timer',
            style: GoogleFonts.amiko(
              textStyle: style,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 60, 10, 60),
              child: Center(
                child: buildTime(),
              ),
            ),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  final style3 = const TextStyle(
    color: Colors.white,
    fontSize: 28,
  );


  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void pauseTimer() {
    timer?.cancel();
  }

  void stopTimer() {
    duration = const Duration();
    timer?.cancel();
  }

  buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    // final isRunning = false;

    return isRunning
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  pauseTimer();
                  setState(() {
                    
                  });
                },
                child: 
                // const Icon(CupertinoIcons.pause),
                 Text(
                  'Pause',
                  style: GoogleFonts.amiko(
                    textStyle: style3,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  stopTimer();
                  setState(() {
                    
                  });
                },
                child: 
                // const Icon(CupertinoIcons.stop),
                Text(
                  'Stop',
                  style: GoogleFonts.amiko(
                    textStyle: style3,
                  ),
                ),
              ),
            ],
          )
        : TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              // debugPrint('Hello there!');
              startTimer();
              setState(() {
                
              });
            },
            child: Text(
              'Start Timer!',
              style: GoogleFonts.amiko(
                textStyle: style3,
              ),
            ),
          );
  }

  buildTime() {
    // if 9 --> 09
    // if 11 --> 11

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildTimeCard(time: hours, header: 'Hours'),
        const SizedBox(width: 8),
        buildTimeCard(time: minutes, header: 'Minutes'),
        const SizedBox(width: 8),
        buildTimeCard(time: seconds, header: 'Seconds'),
      ],
    );
  }
}

const style2 = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  // color: Colors.black,
  fontSize: 72,
);

Widget buildTimeCard({required String time, required String header}) => Column(
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 100, maxHeight: 100),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // color: Color.fromRGBO(255, 175, 204, 1),
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            time,
            textAlign: TextAlign.center,
            style: GoogleFonts.amiko(
              textStyle: style2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Text(
        //   header,
        //   textScaleFactor: 1.5,
        // )
      ],
    );
