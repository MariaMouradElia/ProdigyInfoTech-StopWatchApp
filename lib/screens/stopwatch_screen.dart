import 'package:flutter/material.dart';
import 'package:stopwatch_code/constants/assets.dart';
import 'package:stopwatch_code/screen%20components/elevated_button_for_three.dart';
import 'package:stopwatch_code/screen%20components/lap_column.dart';
import 'dart:async';
import 'package:stopwatch_code/screen%20components/title_row.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});
  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  bool isLapPressed = false;
  bool isPaused = false;
  int lapCounter = 0;
  String timeDisplayed = '00:00:00';
  List<String> currentTimeDisplayed = [];
  List<String> lapTime = [];
  String lapTimeDisplayed = '';
  Stopwatch stopwatch = Stopwatch();
  Stopwatch stopwatch2 = Stopwatch();
  late Timer timer;
  late Timer timer2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: AssetData.titleRowTopPadding, left: AssetData.titleRowLeftPadding),
            child: const TitleRow(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AssetData.clockTopPadding),
                  child:
                  Container(
                    constraints: BoxConstraints(minHeight: AssetData.circularContainerHeight, minWidth: AssetData.circularContainerWidth,),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(AssetData.topLeftOffset,AssetData.topLeftOffset),
                            blurRadius: AssetData.circularContainerBlurRadius,
                            color: Color(AssetData.bodyColor).withOpacity(AssetData.opacityForShadowColor),
                        ),
                        BoxShadow(
                          offset: Offset(AssetData.bottomRightOffset,AssetData.bottomRightOffset),
                          blurRadius: AssetData.circularContainerBlurRadius,
                          color: Colors.black,
                        )
                      ],
                      shape: BoxShape.circle,
                      color: Color(AssetData.circularContainerColor),
                    ),
                    child: isLapPressed
                      ? Align(
                      alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: LapColumn(timeDis: timeDisplayed, lapCount: lapCounter, currTimeDis: currentTimeDisplayed, lpTime: lapTime,)
                        ),
                      )
                      : Center(
                          child: Text(timeDisplayed, style: TextStyle(color: Color(AssetData.btnIconColor), fontSize: AssetData.circularContainerFontSize,),)
                    ),
                  ),
                ),
                SizedBox(height: AssetData.sizedBoxHeight,),
                Row(
                  children: [
                    const Spacer(),
                    ElevatedButtonForThree(btnIcon: Icons.restart_alt_rounded, onPressedBtn: start),
                    const Spacer(),
                    ElevatedButtonForThree(btnIcon: Icons.pause_rounded, onPressedBtn: lap),
                    const Spacer(),
                    ElevatedButtonForThree(btnIcon: Icons.stop_rounded, onPressedBtn: pauseThenReset),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void start(){
    isPaused = false;
    stopwatch.start();
    timer = Timer.periodic(Duration(milliseconds: AssetData.checkTime), updateTime);
    stopwatch2.start();
    timer2 = Timer.periodic(Duration(milliseconds: AssetData.checkTime), updateTime);
  }

  void lap(){
    if (isPaused == false) {
      setState(() {
        lapCounter++;
        isLapPressed = true;
        isPaused = false;
        lapTime.add(lapTimeDisplayed);
        currentTimeDisplayed.add(timeDisplayed);
        stopwatch2.reset();
      });
    }
  }

  void pauseThenReset(){
    switch (isPaused){
      case false:
        isPaused = true;
        timer.cancel();
        stopwatch.stop();
        timer2.cancel();
        stopwatch2.stop();
        break;
      case true:
        timer.cancel();
        stopwatch.reset();
        stopwatch2.reset();
        timer2.cancel();
        setState(() {
          timeDisplayed = '00:00:00';
        });
        isLapPressed = false;
        lapTime.clear();
        currentTimeDisplayed.clear();
        lapCounter = 0;
        break;
    }
  }

  void updateTime(Timer t){
    if (stopwatch.isRunning) {
      setState(() {
        timeDisplayed = '${(stopwatch.elapsed.inMinutes%60).toString().padLeft(2,'0')}:'
            '${(stopwatch.elapsed.inSeconds%60).toString().padLeft(2,'0')}:'
            '${(stopwatch.elapsed.inMilliseconds % 1000 / 10).clamp(0,99).toStringAsFixed(0).toString().padLeft(2,'0')}';
        if (stopwatch2.isRunning) {
          lapTimeDisplayed = ('${(stopwatch2.elapsed.inMinutes%60).toString().padLeft(2,'0')}:'
              '${(stopwatch2.elapsed.inSeconds%60).toString().padLeft(2,'0')}:'
              '${(stopwatch2.elapsed.inMilliseconds % 1000 / 10).clamp(0,99).toStringAsFixed(0).toString().padLeft(2,'0')}'
          );}
      });
    }
  }
}
// #253952
// #2aa3d7
// #2be1f2
