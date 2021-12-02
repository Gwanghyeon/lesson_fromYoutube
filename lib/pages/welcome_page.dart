import 'package:dbestech_211130/cubit/app_cubits.dart';
import 'package:dbestech_211130/minsc/colors.dart';
import 'package:dbestech_211130/widgets/app_text.dart';
import 'package:dbestech_211130/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 메인페이지로 가기전 로그인 페이지 역할
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
                // maxFinite for adjusting size of the container
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('img/' + images[index]),
                        // 이미지가 화면을 꽉차게 설정
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Row(
                      // 사이의 간격을 위한 alignment
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(text: 'Trips'),
                            AppText(
                              text: 'Mountain',
                              size: 30,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              child: AppText(
                                text:
                                    'Mountain hikes give you an incredible sense of freedom along with endurance test',
                                color: AppColors.textColor2,
                                size: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // Button for loading data
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context).getData();
                              },
                              child: ResponsiveButton(),
                            ),
                          ],
                        ),
                        Column(
                          children: List.generate(3, (indexDots) {
                            return Container(
                                margin: const EdgeInsets.only(bottom: 3),
                                width: 8,
                                // height should be dynamic
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: index == indexDots
                                        ? AppColors.mainColor
                                        : AppColors.mainColor
                                            .withOpacity(0.3)));
                          }),
                        ),
                      ]),
                ));
          }),
    );
  }
}
