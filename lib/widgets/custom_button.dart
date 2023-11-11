import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color color;

  const CustomButton({
    super.key, 
    required this.text,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {}, 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric( vertical: 15, horizontal: 10 ),
          color: color,
          // color: const Color(0xFF2C2F88),
          child: Text(
            text, 
            style: const TextStyle( 
              color: Colors.white ,
              fontFamily: 'Montserrat_Medium',
              fontSize: 20,
              fontWeight: FontWeight.w500
            )
          ),
        ),
      )
    );
  }
}