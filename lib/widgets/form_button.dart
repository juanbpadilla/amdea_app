import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  // final String routeName;
  final String name;
  final Color color;
  final TextStyle? textStyle;
  final Function()? loginForm;

  const FormButton({
    super.key, 
    // required this.routeName,
    required this.name,
    required this.color,
    this.textStyle,
    required this.loginForm
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        disabledColor: Colors.grey,
        elevation: 0,
        color: color,
        // ignore: sort_child_properties_last
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Center(
            child: Text(name,
                style: textStyle),
          )),
        onPressed: loginForm
      )
    );
  }
}
