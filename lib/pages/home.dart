import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_game/pages/settings.dart';
import '../bloc/image/bloc.dart';
import '../bloc/image/event.dart';
import '../widgets/card_game_widget.dart';
import '../widgets/container_gradient.dart';
import 'game_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainerGradient(
          child: Stack(
            children: [
              Positioned(right: 42,
                  top: 43,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          return
                            const Settings();
                        }));
                      },
                      child: Image.asset('assets/settings.png',))),
               Column(
                children: [
                  const SizedBox(height: 130,),
                  CardGameWidget(text: 'Игра 1',
                    fun: () {
                      context.read<ImageBloc>().add(LoadImagesEvent());
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return const GamePage(text: 'Игра 1',);
                      }));},),
                  const SizedBox(height: 57,),
                  CardGameWidget(text: 'Игра 2',
                    fun: () {
                      context.read<ImageBloc>().add(LoadImagesEvent());
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return const GamePage(text: 'Игра 2',);
                      }));},),
                  const SizedBox(height: 57,),
                  CardGameWidget(text: 'Игра 3',
                    fun: () {
                      context.read<ImageBloc>().add(LoadImagesEvent());
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return const GamePage(text: 'Игра 3',);
                      }));},),

                ],
              ),
            ],
          ),
        ));
  }
}