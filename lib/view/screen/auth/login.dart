import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/language/custombuttonlang.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('10'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller) => 
         HandlingDataRequest(statusRequest: controller.statusRequest, 
         widget: Container(
             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
             child: Form(
             key: controller.formstate,
             child: ListView(children:  [
            const LogoAuth(),
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "10".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text:  "11".tr),
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
            const SizedBox(height: 10), CustomTextFormAuth(
              valid: (val){
                return validInput(val!, 5, 30,'password');
              },
              obscureText: controller.isshowpassword,
              hinttext: "13".tr,
              iconData:  controller.isshowpassword ? Icons.visibility_off : Icons.visibility ,
              onTapIcon: (){
                controller.showpassword();
              },
              labeltext: "19".tr,
              mycontroller: controller.password, isNumber: false,
            ),
            Row(children: [
              CustomButtonLang(onPressed: (){
                controller.login();
              }, textbutton: "15".tr),
              InkWell(
                onTap: (){controller.goToForgetPassword();},
                child: Text("14".tr,textAlign: TextAlign.end)),
            ]),
            const SizedBox(height: 30),
         //   CustomTextSignUpOrSignIn(textone: "16".tr, texttwo: "17".tr, onTap: () { controller.goToSignUp(); },)
          ]),
        ),
      ),
         ) 
        )
        )
    );
  }
}