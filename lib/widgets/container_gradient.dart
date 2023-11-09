import 'package:flutter/material.dart';

class ContainerGradient extends StatelessWidget {
  const ContainerGradient({super.key, this.child});

  final child;

  @override
  Widget build(BuildContext context) {
    return Container( width: MediaQuery
        .of(context)
        .size
        .width, height: MediaQuery
        .of(context)
        .size
        .height,
      decoration: const BoxDecoration(
        gradient:
        LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x4D2F2BD0),
            Color(0x4DFC15C9),
          ],),),
      child: child,);
  }
}
