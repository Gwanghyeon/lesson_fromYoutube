import 'package:bloc/bloc.dart';
import 'package:dbestech_211130/model/data_model.dart';
import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

// 모든 큐빗클래스는 initialState가 요구됨
class InitialState extends CubitStates {
  @override
  // get data in list
  List<Object> get props => [];
}

// Showing WelcomePage
class WelcomState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState({required this.places});
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}
