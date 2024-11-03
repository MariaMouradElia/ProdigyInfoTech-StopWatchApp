import 'package:flutter/material.dart';
import 'package:stopwatch_code/constants/assets.dart';

class ElevatedButtonForThree extends StatelessWidget {
  final IconData btnIcon;
  void Function()? onPressedBtn;
  ElevatedButtonForThree({super.key, required this.btnIcon, required this.onPressedBtn});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedBtn,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        fixedSize: Size(AssetData.btnWidth, AssetData.btnHeight),
        shape: CircleBorder(side: BorderSide(color: Color(AssetData.btnBorderOutlineColor), width: AssetData.btnBorderWidth),),
      ),
      child: Icon(btnIcon,color: Color(AssetData.btnIconColor), size: AssetData.btnIconSize,),
    );
  }
}
