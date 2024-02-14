import 'package:admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/categories_data.dart';

class CategoriesController extends GetxController {

  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.get();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        List datalist = response['data'];
       data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoeditpage(CategoriesModel categoriesModel){
    Get.toNamed('categoriesedit',arguments: {'categoriesmodel':categoriesModel});
  }

  deletecategory(String id , String imagename) async {
   await categoriesData.delete({'id':id,'imagename':imagename});
   data.removeWhere((element) => element.categoriesId == id);
   update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}