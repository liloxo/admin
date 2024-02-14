import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool? obscureText;
  final bool isNumber;
  final void Function()? onTapIcon;

  const CustomTextFormAuth(
      {Key? key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      this.valid, 
      required this.isNumber, this.obscureText, this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true): TextInputType.text,
        validator: valid,
        cursorColor: AppColor.primaryColor,
        controller: mycontroller,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColor.primaryColor),borderRadius: BorderRadius.all(Radius.circular(30))),
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
                suffixIconColor: AppColor.primaryColor,
            suffixIcon: InkWell(onTap: onTapIcon,child: Icon(iconData)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}