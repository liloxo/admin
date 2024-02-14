import 'dart:io';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/categories_data.dart';

class EditCategoriesController extends GetxController {

  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;
  File? file;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  CategoriesModel? categoriesModel;

  chooseImage()async{
    file = await fileuploadgallery(true);
    update(); 
  }

  editData() async {
    if(key.currentState!.validate()){
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
     'name' : name.text,
     'namear' : namear.text,
     'imageold': categoriesModel!.categoriesImage,
     'id': categoriesModel!.categoriesId.toString()
    }; 
    var response = await categoriesData.edit(data,file);
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
    categoriesModel = Get.arguments['categoriesmodel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    namear.text = categoriesModel!.categoriesNameAr!;
    super.onInit();
  }
}