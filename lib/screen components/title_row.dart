import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stopwatch_code/constants/assets.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AssetData.appTitle,
          style: TextStyle(
              color: Color(AssetData.appbarTextColor),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              fontSize: AssetData.appTitleFontSize
          ),
        ),
        SvgPicture.asset(AssetData.appTitleSvg, width: AssetData.clockSvgWidth, height: AssetData.clockSvgHeight)
      ],
    );
  }
}
