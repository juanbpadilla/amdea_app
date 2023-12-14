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

  const CustomButton({
    super.key, 
    required this.text,
    required this.routeName,
    required this.color, 
    required this.textStyle, 
    this.icon, 
    this.paddingv, 
    this.paddingh
  });


  @override
  Widget build(BuildContext context) {

    return TextButton(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric( vertical: paddingv ?? 10, horizontal: paddingh ?? 30 ),
          color: color,
          // color: const Color(0xFF2C2F88),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  'assets/icons/$icon',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  // height: 70,
                ),
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
      onPressed: routeName, 
    );
  }
}