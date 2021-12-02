import 'package:dbestech_211130/cubit/app_cubit_status.dart';
import 'package:dbestech_211130/cubit/app_cubits.dart';
import 'package:dbestech_211130/minsc/colors.dart';
import 'package:dbestech_211130/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// TickerProviderStateMixin for TabBar, it provides vsync value
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map<String, String> images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling'
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body:
        // AppCubits의 prop된 데이터 사용을 위한 BlocBuilder의 사용
        BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          // BlocBuiler 를 사용하기에 접근할 수 있는 데
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // menu text
              Container(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, size: 30, color: Colors.black54),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              // discover text
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: AppLargeText(text: 'Discover')),
              const SizedBox(
                height: 10,
              ),
              // Tabbar 3가지 메뉴 이동
              Container(
                child: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    // place, inspiration,
                    tabs: const [
                      Tab(
                        text: 'Places',
                      ),
                      Tab(
                        text: 'Inspiration',
                      ),
                      Tab(
                        text: 'Emotions',
                      ),
                    ]),
              ),
              // 탭바에 연결된 3가지 페이지
              Container(
                height: 200,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.only(left: 15),
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10, top: 10),
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'http://mark.bslmeiyu.com/uploads/' +
                                          info[index].img))),
                        );
                      },
                    ),
                    Text('2'),
                    Text('3')
                  ],
                ),
              ),
              // tabbar
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(text: 'Explore more', size: 20),
                    AppText(
                      text: 'See all',
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 80,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                        margin: const EdgeInsets.only(right: 30, left: 10),
                        child: Column(children: [
                          Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'img/' + images.keys.elementAt(index),
                                      )))),
                          Container(
                            child: AppText(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2),
                          ),
                        ]));
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

// 작은 원을 그리기 위한 클래스 extending Decoration
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    // 위치를 계산하기 위한 변수
    final Offset circleOffset = Offset(
        // X 좌표
        configuration.size!.width / 2 - radius / 2,
        // Y 좌표
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
