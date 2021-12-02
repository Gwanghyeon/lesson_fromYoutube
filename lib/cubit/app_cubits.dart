import 'package:bloc/bloc.dart';
import 'package:dbestech_211130/cubit/app_cubit_status.dart';
import 'package:dbestech_211130/services/data_services.dart';

// 어떤 형태의 큐빗이 될지 제네릭을 사용하여 선언
class AppCubits extends Cubit<CubitStates> {
  // 생성자에서 initialState 선언
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomState());
  }

  final DataServices data;
  late final places;
  // call from the welcome_page through the button
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places: places));
    } catch (e) {
      print(e);
    }
  }
}
