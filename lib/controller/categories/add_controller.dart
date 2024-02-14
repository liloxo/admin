import 'dart:io';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/categories_data.dart';

class AddCategoriesController extends GetxController {

  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;
  File? file;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  chooseImage()async{
    file = await fileuploadgallery(true);
    update(); 
  }

  addData() async {
    if(key.currentState!.validate()){
      if(file == null) Get.snackbar('Warning', 'Choose an Svg image');
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
     'name' : name.text,
     'namear' : namear.text,
    }; 
    var response = await categoriesData.add(data,file!);
    //print("======================== $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        Get.offAllNamed('categoriesview');
        CategoriesController c = Get.find();
        c.getData();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}