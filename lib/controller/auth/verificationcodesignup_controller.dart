import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/verifycoderemote.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  goToSuccessSignUp(String verificationCode);
  checkCode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeSignupData verifycodesignupdata = VerifyCodeSignupData(Get.find());

  @override
  goToSuccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
      update();
      var response = await verifycodesignupdata.postdata(email!, verificationCode);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == 'success'){
          //data.addAll(response['data']);
              Get.offNamed("successsignup");  
        }else{
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "Error",middleText: "wrong code");
        }
      }
      update();
  }

  @override
  checkCode() {
  }

  resendCode(){
    verifycodesignupdata.resendData(email!);
  }


  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}