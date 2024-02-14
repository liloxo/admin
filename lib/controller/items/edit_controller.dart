import 'dart:io';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';
import 'view_controller.dart';

class EditItemsController extends GetxController {

  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController catid;
  late TextEditingController catname;
  File? file;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  List<SelectedListItem> dropdownlist = [];
  ItemsModel? itemsModel;
  String? active;

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.get();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        List<CategoriesModel> data = [];
        List datalist = response['data'];
       data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
       for (var i = 0; i < data.length; i++) {
         dropdownlist.add(SelectedListItem(name: data[i].categoriesName!,value: data[i].categoriesId));
       }
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  changestatus(String val){
   active = val;
   update();
  }

  chooseImageGallery()async{
    file = await fileuploadgallery(false);
    update(); 
  }
  chooseImageCamera()async{
    file = await imageuploadcamera();
    update(); 
  }

  showOptionImage(){
    showbuttommenu(chooseImageCamera,chooseImageGallery);
  }

  editData() async {
    if(key.currentState!.validate()){
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
     'id': itemsModel!.itemsId,
     'imageold': itemsModel!.itemsImage,
     'name' : name.text,
     'namear' : namear.text,
     'desc':desc.text,
     'descar':descar.text,
     'count':count.text,
     'active': active,
     'discount': discount.text,
     'catid': catid.text,
     'price': price.text,
     'datenow': DateTime.now().toString()
    };  
    var response = await itemsData.edit(data,file);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        Get.offNamed('itemsview');
        ItemsController c = Get.find();
        c.getData();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    }
  }

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsmodel'];
    active = itemsModel!.itemsActive;
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    dropdownid = TextEditingController();
    dropdownname = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    discount.text = itemsModel!.itemsDiscount!;
    price.text = itemsModel!.itemsPrice!;
    count.text = itemsModel!.itemsCount!;
    catid.text = itemsModel!.categoriesId!;
    catname.text = itemsModel!.categoriesName!;
    getCategories();
    super.onInit();
  }
}