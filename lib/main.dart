import 'package:flutter/material.dart';
import 'package:stopwatch_code/constants/assets.dart';
import 'package:stopwatch_code/screens/stopwatch_screen.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(AssetData.bodyColor),
        ),
        home: StopwatchScreen(),
      ),
    );
  }
}
