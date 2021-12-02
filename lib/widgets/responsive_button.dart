// 버튼 위젯
import 'package:dbestech_211130/minsc/colors.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class ResponsiveButton extends StatelessWidget {
  // 짧은 버튼 혹은 긴 버튼 결정
  bool isResponsive;
  double? width;
  double? height;
  ResponsiveButton(
      {Key? key, this.width = 100, this.height = 40, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
            mainAxisAlignment: isResponsive
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child:
                          AppText(text: 'Book Trip Now', color: Colors.white))
                  : Container(),
              Image.asset('img/button-one.png'),
            ]),
      ),
    );
  }
}
