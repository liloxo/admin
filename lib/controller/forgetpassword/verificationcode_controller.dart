import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/verifycodeforgetpassword.dart';

abstract class VerifyCodeController extends GetxController{
  goToResetPassword(String verificationCode);
  checkCode();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  late String verifycode;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  StatusRequest? statusRequest;

  @override
  goToResetPassword(verificationCode) async {
    statusRequest = StatusRequest.loading;
      update();
      var response = await verifyCodeData.postdata(email!, verificationCode);
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status'] == 'success'){
          //data.addAll(response['data']);
            Get.toNamed("/resetpassword",arguments: {'email' : email});  
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
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}