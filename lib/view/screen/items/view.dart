import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controller/items/view_controller.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(title: const Text('Items'),centerTitle: true,),
      floatingActionButton: FloatingActionButton(onPressed: (){Get.toNamed('itemsadd');},child: const Icon(Icons.add),),
      body: GetBuilder<ItemsController>(builder: (controller){
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
                          child: CachedNetworkImage(
                            imageUrl: "${AppLink.imagestaticItems}/${controller.data[i].itemsImage}",
                            height: 100,
                          ),
                        )
                      ),
                      Expanded(
                        flex: 3,
                        child: ListTile(
                          trailing: IconButton(onPressed: (){
                            Get.defaultDialog(
                              middleText: 'Are you sure you want to delete',
                              onCancel: () {
                                
                              },
                              onConfirm: () {
                              controller.deleteItem(controller.data[i].itemsId!, controller.data[i].itemsImage!);Get.back();
                            },);
                          }, icon: const Icon(Icons.delete)),
                          title: Text(controller.data[i].itemsName!),
                          subtitle: Text(controller.data[i].categoriesName!),
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