import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/language/custombuttonlang.dart'; 

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('43'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(builder: ((controller) =>
         HandlingDataRequest(statusRequest: controller.statusRequest, 
         widget:Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "35".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "35".tr),
            const SizedBox(height: 15),
             CustomTextFormAuth(
              valid: (val){
                return validInput(val!, 5, 30,'password');
              },
              mycontroller: controller.password,
              hinttext: "13".tr,
              iconData: Icons.lock_outline,
              labeltext: "19".tr, isNumber: false,
             // mycontroller: ,
           ),
           const SizedBox(height: 10),
           CustomTextFormAuth(
              valid: (val){
                return validInput(val!, 5, 30,'password');
              },
             mycontroller: controller.repassword,
             hinttext: "42".tr,
              iconData: Icons.lock_outline,
              labeltext: "19".tr, isNumber: false,
             // mycontroller: ,
           ),
            CustomButtonLang(textbutton: "33".tr, onPressed: () {
              controller.goToSuccessResetPassword();
            }),
            const SizedBox(height: 40),
          ]),
        ),
      )
      )))
    );
  }
}