import 'package:bloc/bloc.dart';
import 'package:samui_vr_app/cubit/app_cubit_states.dart';
import 'package:samui_vr_app/model/data_model.dart';
import 'package:samui_vr_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(initialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  Future<void> getData() async {
    try{
      emit(LoadingState());
      places = await data.getInfo();
    }catch(e){
    }
  }
}