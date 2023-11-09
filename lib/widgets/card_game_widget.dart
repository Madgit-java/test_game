import 'package:flutter/material.dart';

class CardGameWidget extends StatelessWidget {
  const CardGameWidget({super.key, this.text, this.fun});

  final text;
  final Function()? fun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: 166,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
        child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            )
        ),
      ),
    );
  }
}
