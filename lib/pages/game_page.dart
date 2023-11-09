import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image/bloc.dart';
import '../bloc/image/event.dart';
import '../bloc/image/state.dart';
import '../widgets/container_gradient.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.text});

  final String text;
  @override
  State<GamePage> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerGradient(
        child: Stack(
          children: [
            Positioned( top: 57, left: 25,
                child: Row(
                  children: [
                    GestureDetector(onTap: (){Navigator.of(context).pop();},
                        child: Image.asset('assets/back.png',)),
                    const SizedBox(width: 20,),
                    Text(widget.text, style: const TextStyle(fontSize: 20, color: Colors.white),),
                  ],
                )),
            BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ImageLoadedState) {
                  return
                      Center(child: GestureDetector(onTap: (){
                        counter++;
                        if (counter==3){
                          context.read<ImageBloc>().add(EndImageEvent());
                        }else {
                          context.read<ImageBloc>().add(ChangeImageEvent());
                        }
                        },
                          child: Image.network(state.image)));
                } if (state is ImageEndState) {
                  return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Игра окончена', style: TextStyle(fontSize: 28),),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Вернуться на главный экран'),
                        ),
                      ),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
