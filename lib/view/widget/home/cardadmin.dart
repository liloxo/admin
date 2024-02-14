import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  final void Function()? onTap;
  final String url;
  final String title;
  const CardAdminHome({Key? key, required this.onTap, required this.url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(url,width: 80,),
           const SizedBox(height: 10),
           Text(title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}