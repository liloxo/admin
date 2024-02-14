import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  const CustomButtonLang({Key? key, required this.onPressed, required this.textbutton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: 220,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textbutton,style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
    );
  }
}