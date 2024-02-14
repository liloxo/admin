/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/archive_controller.dart';
import '../../../core/constant/color.dart';

  void showdialog(BuildContext context,String ordersid){
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset('assets/images/logoapp.png',height: 200,width: 200,),
      submitButtonText: 'Submit',
      submitButtonTextStyle: const TextStyle(color: AppColor.primaryColor),
      commentHint: 'Set your custom comment hint',
      onCancelled: () {},
      onSubmitted: (response) {
        OrdersArchiveController controller = Get.find();
        controller.submitrating(ordersid,response.rating,response.comment);

        // 
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          
        }
      },
    )
    );
    }*/