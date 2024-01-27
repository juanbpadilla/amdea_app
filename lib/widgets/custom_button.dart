import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function()? routeName;
  final Color color;
  final TextStyle textStyle;
  final String? icon;
  final double? paddingv;
  final double? paddingh;
  final double? circular;

  const CustomButton({
    super.key, 
    required this.text,
    required this.routeName,
    required this.color, 
    required this.textStyle, 
    this.icon, 
    this.paddingv, 
    this.paddingh,
    this.circular
  });


  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: routeName,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circular ?? 50),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric( vertical: paddingv ?? 10, horizontal: paddingh ?? 10 ),
          color: color,
          // color: const Color(0xFF2C2F88),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon != null ? Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/$icon',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    // height: 70,
                  ),
                  const SizedBox(width: 5,)
                ],
              )
              : Container(),

              Text(
                text,
                style: textStyle
              ),
            ]
          )
        ),
      ), 
    );
  }
}