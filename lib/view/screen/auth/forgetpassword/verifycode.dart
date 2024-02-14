
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:admin/view/widget/auth/customtextbodyauth.dart';
import 'package:admin/view/widget/auth/customtexttitleauth.dart';
import '../../../../controller/forgetpassword/verificationcode_controller.dart';
import '../../../../core/constant/color.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
  VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('39'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: ListView(children:  [
          const SizedBox(height: 20),
          CustomTextTitleAuth(text: "40".tr),
          const SizedBox(height: 10),
          CustomTextBodyAuth(text: "41".tr),
          const SizedBox(height: 20),
          OtpTextField(
           borderRadius: BorderRadius.circular(15),
           fieldWidth: 50,
           numberOfFields: 5,
           borderColor: AppColor.primaryColor,
           //set to true to show as box or false to show as dash
           showFieldAsBox: true, 
           //runs when a code is typed in
           onCodeChanged: (String code) {
               //handle validation or checks here           
           },
           //runs when every textfield is filled
           onSubmit: (String verificationCode){
            controller.goToResetPassword(verificationCode);
           }, // end onSubmit
          ),
          const SizedBox(height: 10)
        ]),
      ),
    );
  }
}