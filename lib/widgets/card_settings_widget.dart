import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardSettingsWidget extends StatelessWidget {
  const CardSettingsWidget({super.key, this.text, this.widget});

  final text;
  final widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 128,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.white
        ), child:
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(width: 20,),
            Image.asset('assets/sound.png',),
            const SizedBox(width: 20,),
            const Text(
                "Звук",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                )
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(right: 20), child: widget,),
      ],
    ),);
  }
}
