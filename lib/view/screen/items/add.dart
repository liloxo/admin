import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/items/add_controller.dart';
import '../../../core/shared/customdropdownsearch.dart';
import '../../../core/shared/customtextformglobal.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemsController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add Item'),),
      body: GetBuilder<AddItemsController>(
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
                  hinttext: 'Item name', 
                  labeltext: 'Item name', 
                  iconData: Icons.category, 
                  mycontroller: controller.name, 
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  },
                  isNumber: false
                ),
              ),
              CustomTextFormGlobal(
                hinttext: 'Item name arabic', 
                labeltext: 'Item name arabic', 
                iconData: Icons.category, 
                mycontroller: controller.namear, 
                valid: (val){
                  return validInput(val!, 1, 30, '');
                },
                isNumber: false
              ),
              CustomTextFormGlobal(
                hinttext: 'Description', 
                labeltext: 'Description', 
                iconData: Icons.category, 
                mycontroller: controller.desc, 
                valid: (val){
                  return validInput(val!, 1, 30, '');
                },
                isNumber: false
              ),
              CustomTextFormGlobal(
                hinttext: 'Description arabic', 
                labeltext: 'Description arabic', 
                iconData: Icons.category, 
                mycontroller: controller.descar, 
                valid: (val){
                  return validInput(val!, 1, 30, '');
                },
                isNumber: false
              ),
              CustomTextFormGlobal(
                hinttext: 'Count', 
                labeltext: 'Count', 
                iconData: Icons.category, 
                mycontroller: controller.count, 
                valid: (val){
                  return validInput(val!, 1, 30, '');
                },
                isNumber: true
              ),
              CustomTextFormGlobal(
                hinttext: 'Price', 
                labeltext: 'Price', 
                iconData: Icons.category, 
                mycontroller: controller.price, 
                valid: (val){
                  return validInput(val!, 1, 30, '');
                },
                isNumber: true
              ),
              CustomTextFormGlobal(
                hinttext: 'Discount', 
                labeltext: 'Discount', 
                iconData: Icons.category, 
                mycontroller: controller.discount, 
                valid: (val){
                  return validInput(val!, 1, 30, '');
                },
                isNumber: true
              ),
              Customdropdownsearch(
                title: 'Choose Category',
                listdata: controller.dropdownlist, 
                selectedname: controller.catname, 
                selectedid: controller.catid,),
                Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  color: AppColor.thirdColor,
                  textColor: AppColor.secoundColor,
                  onPressed: (){
                    controller.showOptionImage();
                  },
                  child: const Text('Select Item Image'),
                ),
              ),
              if(controller.file != null) 
              Image.file(controller.file!,height: 100,width: 100,),
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