import 'dart:io';

import 'package:admin/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageuploadcamera()async{
  final PickedFile? file = await ImagePicker().getImage(source: ImageSource.camera,imageQuality: 90);
  if(file != null){
    return File(file.path);
  }else {
    return null;
  }
}

fileuploadgallery([isSvg = false])async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg ? ['svg','SVG'] : ['PNG','png','jpg','jpeg','gif']
  );
  if(result!=null){
    return File(result.files.single.path!);
  }else{
    return null;
  }
}

showbuttommenu(Function() imageuploadcamera,Function() fileuploadgallery){
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl, 
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('أختيار صورة',style: TextStyle(fontSize: 22,color: AppColor.primaryColor,fontWeight: FontWeight.bold)),
            ListTile(
              onTap: () {
                imageuploadcamera();
                Get.back();
              },
              leading: const Icon(Icons.camera_alt,size: 40,),
              title: const Text('صورة من الكاميرا',style: TextStyle(fontSize: 20),),
            ),
            ListTile(
              onTap: () {
                fileuploadgallery();
                Get.back();
              },
              leading: const Icon(Icons.image,size: 40,),
              title: const Text('صورة من الاستوديو',style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      )
    ),
    backgroundColor: Colors.white
  );
}