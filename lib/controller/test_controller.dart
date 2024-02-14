import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/test_data.dart';

class TestController extends GetxController {

  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  getDataController() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    //print("======================== $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
       data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
     update();
  }

  @override
  void onInit() {
    getDataController();
    super.onInit();
  }
}