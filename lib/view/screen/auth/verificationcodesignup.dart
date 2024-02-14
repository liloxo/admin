import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verificationcodesignup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
   Get.put(VerifyCodeSignUpControllerImp());
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
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller)=>
       HandlingDataRequest(statusRequest: controller.statusRequest, 
         widget:Container(
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
            controller.goToSuccessSignUp(verificationCode);
           }, // end onSubmit
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: (){
              controller.resendCode();
            },
            child: const Center(child: Text('Resend Code',style: TextStyle(fontSize: 20))),
          )
        ]),
      )))
    );
  }
}