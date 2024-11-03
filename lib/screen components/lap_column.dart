import 'package:flutter/material.dart';
import 'package:stopwatch_code/constants/assets.dart';
class LapColumn extends StatelessWidget {
  String timeDis;
  int lapCount = 0;
  List<String> currTimeDis;
  List<String> lpTime;
  LapColumn({super.key, required this.timeDis, required this.lapCount, required this.currTimeDis, required this.lpTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(timeDis, style: TextStyle(color: Color(AssetData.btnIconColor), fontSize: AssetData.circularContainerFontSize,),),
        SizedBox(height: AssetData.sizedBoxAboveLapHeader,),
        Row(
          children: [
            Text("Lap", style: TextStyle(
                fontSize: AssetData.lapHeaderFontSize,
                fontWeight: FontWeight.w400,
                color: Color(AssetData.lapHeaderColor)
            ),),
            const Spacer(),
            Text("Lap times", style: TextStyle(
                fontSize: AssetData.lapHeaderFontSize,
                fontWeight: FontWeight.w400,
                color: Color(AssetData.lapHeaderColor)
            ),),
            const Spacer(),
            Text("Overall time", style: TextStyle(
                fontSize: AssetData.lapHeaderFontSize,
                fontWeight: FontWeight.w400,
                color: Color(AssetData.lapHeaderColor)
            ),),
          ],
        ),
        SizedBox(height: AssetData.sizedBoxUnderLapHeader,),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: AssetData.lapListSize),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: lapCount,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: AssetData.lapListTileLeftPadding, right: AssetData.lapListTileRightPadding, bottom: AssetData.lapListTileBottomPadding),
                child: Row(
                  children: [
                    Text('${index+1}', style: TextStyle(
                        fontSize: AssetData.lapTileTextFontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(AssetData.lapTextColor)
                    ),),
                    const Spacer(),
                    Text(lpTime[index], style: TextStyle(
                        fontSize: AssetData.lapTileTextFontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(AssetData.lapTextColor)
                    ),),
                    const Spacer(),
                    Text(currTimeDis[index], style: TextStyle(
                        fontSize: AssetData.lapTileTextFontSize,
                        fontWeight: FontWeight.bold,
                        color: Color(AssetData.lapTextColor)
                    ),),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
