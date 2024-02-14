import 'dart:io';
import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import 'package:drop_down_list/drop_down_list.dart';
import '../../data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';

class AddItemsController extends GetxController {

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

  showdrop(BuildContext context){
    DropDownState(
      DropDown(
        bottomSheetTitle:  const Text(
          'title',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: 'a'),SelectedListItem(name: 'b')],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropdownname.text = selectedListItem.name;
        },
      ),
    ).showModal(context);
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

  addData() async {
    if(key.currentState!.validate()){
      if(file == null) Get.snackbar('Warning', 'Choose an image');
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
     'name' : name.text,
     'namear' : namear.text,
     'desc':desc.text,
     'descar':descar.text,
     'count':count.text,
     'discount': discount.text,
     'catid': catid.text,
     'price': price.text,
     'datenow': DateTime.now().toString()
    }; 
    var response = await itemsData.add(data,file!);
    //print("======================== $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
        Get.offAllNamed('itemsview');
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
    getCategories();
    super.onInit();
  }
}