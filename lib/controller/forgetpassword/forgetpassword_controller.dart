import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/checkemailforgetpassword.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  
  @override
  checkEmail() async {
    if(formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == 'success'){
          Get.toNamed("verifycode",arguments: {"email" : email.text});  
        }else{
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "Error",middleText: "Email is Incorrect");
        }
      }
      update();
    }else{

    }
  }


  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
}