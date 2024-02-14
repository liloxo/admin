import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/model/itemsmodel.dart';

class ItemsController extends GetxController {

  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.get();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        List datalist = response['data'];
       data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoeditpage(ItemsModel itemsModel){
    Get.toNamed('itemsedit',arguments: {'itemsmodel':itemsModel});
  }

  deleteItem(String id , String imagename) async {
   await itemsData.delete({'id':id,'imagename':imagename});
   data.removeWhere((element) => element.itemsId == id);
   update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}