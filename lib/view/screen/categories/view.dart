import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../controller/categories/view_controller.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(title: const Text('Categories'),centerTitle: true,),
      floatingActionButton: FloatingActionButton(onPressed: (){Get.toNamed('categoriesadd');},child: const Icon(Icons.add),),
      body: GetBuilder<CategoriesController>(builder: (controller){
        return HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context,i){
              return InkWell(
                onTap: () => controller.gotoeditpage(controller.data[i]),
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.network(
                            "${AppLink.imagestCategories}/${controller.data[i].categoriesImage}",
                            height: 100,
                          ),
                        )
                      ),
                      Expanded(
                        flex: 3,
                        child: ListTile(
                          trailing: IconButton(onPressed: (){
                            Get.defaultDialog(onConfirm: () {
                              controller.deletecategory(controller.data[i].categoriesId!, controller.data[i].categoriesImage!);Get.back();
                            },);
                          }, icon: const Icon(Icons.delete)),
                          title: Text(controller.data[i].categoriesName!),
                          subtitle: Text(controller.data[i].categoriesDatetime!),
                        )
                      ),
                    ],
                  ),
                ),
              );
            }),
          )
        );
      }),
    );
  }
}