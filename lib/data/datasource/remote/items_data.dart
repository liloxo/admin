import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:admin/core/class/statusrequest.dart';
import '../../../core/class/crud.dart';
import '../../../core/constant/linkapi.dart';

class ItemsData {

  Crud crud;
  ItemsData(this.crud);

  get()async{
    var response = await crud.postData(AppLink.itemsview, {});
    return response!.fold((l) => l, (r) => r);
  }

  add(Map data,File file)async{
    var response = await crud.addRequestWithImageOne(AppLink.itemsadd, data,file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data,[File? file])async{
    Either<StatusRequest, Map>? response;
    if(file == null){
      response = await crud.postData(AppLink.itemsedit, data);
    }else{
      response = await crud.addRequestWithImageOne(AppLink.itemsedit, data, file);
    }
    return response!.fold((l) => l, (r) => r);
  }

  delete(Map data)async{
    var response = await crud.postData(AppLink.itemsdelete, data);
    return response!.fold((l) => l, (r) => r);
  }
}