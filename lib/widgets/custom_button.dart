import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function() routeName;
  final Color color;
  final TextStyle textStyle;

  const CustomButton({
    super.key, 
    required this.text,
    required this.routeName,
    required this.color, 
    required this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: routeName, 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10 ),
          color: color,
          // color: const Color(0xFF2C2F88),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/check-square.svg',
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                // height: 70,
              ),
              const SizedBox( width: 5, ),
              Text(
                text,
                style: textStyle
              ),
            ]
          )
        ),
      )
    );
  }
}