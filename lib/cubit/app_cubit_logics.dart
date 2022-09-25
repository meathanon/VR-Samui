import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samui_vr_app/cubit/app_cubit_states.dart';
import 'package:samui_vr_app/cubit/app_cubits.dart';
import 'package:samui_vr_app/screen/login.dart';
import 'package:samui_vr_app/screen/register.dart';
import 'package:samui_vr_app/screens/home_screen.dart';

class AppCubitsLogics extends StatefulWidget {
  AppCubitsLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitsLogics> createState() => _AppCubitsLogicsState();
}

class _AppCubitsLogicsState extends State<AppCubitsLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is WelcomeState){
            return Login();
          }if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else {
            return Container();
          }
        },
      ),
    );
  }
}