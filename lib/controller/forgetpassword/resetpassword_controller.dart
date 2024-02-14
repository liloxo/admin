import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/resetpasswordforgetpassword.dart';

abstract class ResetPasswordController extends GetxController{
  goToSuccessResetPassword();
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  goToSuccessResetPassword() async {
    if(password.text != repassword.text){
      return Get.defaultDialog(title: "Error", middleText: "Passwords Don't Match");
    }
    statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(email!,password.text);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == 'success'){
          //data.addAll(response['data']);
          Get.offNamed("successresetpassword"); 
        }else{
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "Error",middleText: "Something is wrong Try Again");
        }
      }
      update();
  }
  @override
  resetPassword() {
  }
  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }
}