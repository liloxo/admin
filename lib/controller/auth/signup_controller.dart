import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/signupremote.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data = [];


  @override
  signUp() async { 
    if(formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(username.text, email.text,phone.text, password.text);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == 'success'){
          //data.addAll(response['data']);
          Get.offNamed("verifycodesignup",arguments: {
            "email" : email.text
          });  
        }else{
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "Error",middleText: "Email Or PhoneNumber Already Exists");
        }
      }
      update();
    }else{

    }
  }

  @override
  goToSignIn() {
    Get.offNamed("login");
  }

  @override
  void onInit() {
    username = TextEditingController() ; 
    phone = TextEditingController() ; 
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

}