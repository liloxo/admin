import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/add_controller.dart';
import '../../../core/shared/customtextformglobal.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddCategoriesController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add Category'),),
      body: GetBuilder<AddCategoriesController>(
        builder: (controller) {
        return Container(
          margin: const EdgeInsets.all(20),
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Form(
            key: controller.key,
            child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: CustomTextFormGlobal(
                  hinttext: 'category name', 
                  labeltext: 'category name', 
                  iconData: Icons.category, 
                  mycontroller: controller.name, 
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  },
                  isNumber: false
                ),
              ),
              CustomTextFormGlobal(
                hinttext: 'category name arabic', 
                labeltext: 'category name arabic', 
                iconData: Icons.category, 
                mycontroller: controller.namear, 
                valid: (val){
                  return validInput(val!, 1, 30, '');
                },
                isNumber: false
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  color: AppColor.thirdColor,
                  textColor: AppColor.secoundColor,
                  onPressed: (){
                    controller.chooseImage();
                  },
                  child: const Text('Select Category Image'),
                ),
              ),
              if(controller.file != null) 
              SvgPicture.file(controller.file!),
              CustomButton(
                text: 'Add',
                onPressed: (){
                  controller.addData();
                },
              )
            ],
                ),
          ),
          )
        );
      },)
    );
  }
}