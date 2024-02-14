import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

Future<bool> alertExitApp(){
  Get.defaultDialog(
    title: '44'.tr,
    middleText: '45'.tr,
    actions: [
        MaterialButton(
        color: AppColor.primaryColor,
          onPressed: (){
          exit(0);
          }, 
          child: Text('46'.tr, style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15))
          ),
      MaterialButton(
        color: AppColor.primaryColor,
        onPressed: (){
          Get.back();
        }, 
        child: Text('47'.tr, style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15))
        )
    ]
  );
  return Future.value(true);
}