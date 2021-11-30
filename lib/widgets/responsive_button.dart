// 버튼 위젯
import 'package:dbestech_211130/minsc/colors.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  // 짧은 버튼 혹은 긴 버튼 결정
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('img/button-one.png'),
      ]),
    );
  }
}
