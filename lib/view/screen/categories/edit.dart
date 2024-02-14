import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/categories/edit_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/customtextformglobal.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoriesController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add Category'),),
      body: GetBuilder<EditCategoriesController>(
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
                text: 'Edit',
                onPressed: (){
                  controller.editData();
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