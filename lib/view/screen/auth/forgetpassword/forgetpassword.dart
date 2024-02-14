import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/language/custombuttonlang.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
   Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('14'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) =>
       HandlingDataRequest(statusRequest: controller.statusRequest, 
         widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Form(
          key: controller.formstate,
          child: ListView(children:  [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "27".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
                text: "29".tr),
            const SizedBox(height: 20),
            CustomTextFormAuth(
              valid: (val){
                return validInput(val!, 5, 100,'email');
              },
              hinttext: "12".tr,
              iconData: Icons.email_outlined,
              labeltext: "18".tr,
              mycontroller: controller.email, isNumber: false ,
            ),
            const SizedBox(height: 10),
            CustomButtonLang(onPressed: (){controller.checkEmail();}, textbutton: "30".tr)
          ]),
        ),
      )
      ))
    );
  }
}