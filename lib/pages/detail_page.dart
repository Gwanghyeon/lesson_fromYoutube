import 'package:dbestech_211130/minsc/colors.dart';
import 'package:dbestech_211130/widgets/app_buttons.dart';
import 'package:dbestech_211130/widgets/app_text.dart';
import 'package:dbestech_211130/widgets/responsive_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              //스택으로 수서별로 위에 쌓아갈 수 있도록 설정
              // 배경 이미지
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                      width: double.maxFinite,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('img/mountain.jpeg'),
                        fit: BoxFit.cover,
                      )))),
              Positioned(
                  left: 20,
                  top: 60,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Positioned(
                  top: 250,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 30, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title Text with Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: 'Yosemite',
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: '\$ 250',
                              color: AppColors.mainColor,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.mainColor),
                            const SizedBox(
                              width: 4,
                            ),
                            AppText(
                                text: 'USA, California',
                                color: AppColors.textColor1),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: gottenStars < index + 1
                                        ? AppColors.textColor2
                                        : AppColors.starColor);
                              }),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(text: '(4.0)', color: AppColors.textColor2),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppLargeText(
                          text: 'People',
                          color: Colors.black.withOpacity(0.8),
                          size: 18,
                        ),
                        AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainTextColor,
                          size: 12,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // 인원수 체크 박스
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedindex = index;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 4),
                                      child: AppButtons(
                                        size: 45,
                                        color: index == selectedindex
                                            ? Colors.white
                                            : Colors.black,
                                        backgroundColor: index == selectedindex
                                            ? Colors.black.withOpacity(0.8)
                                            : AppColors.buttonBackground,
                                        borderColor: AppColors.buttonBackground,
                                        text: (index + 1).toString(),
                                      ),
                                    ),
                                  )),
                        )
                      ],
                    ),
                  )),
              // 위젯 위치를 고정 시킬 수 있는 위젯
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(children: [
                  AppButtons(
                    color: AppColors.mainColor,
                    backgroundColor: AppColors.buttonBackground,
                    borderColor: AppColors.mainColor,
                    size: 60,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(width: 5),
                  ResponsiveButton(
                    isResponsive: true,
                    height: 60,
                  )
                ]),
              )
            ],
          )),
    );
  }
}
