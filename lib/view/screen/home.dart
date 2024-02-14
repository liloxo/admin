import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Orders'),),
      body:  ListView(
         children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 150),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardAdminHome(url: AppImageAsset.categories, title: 'Categories', onTap: () { Get.toNamed('categoriesview'); },),
              CardAdminHome(url: AppImageAsset.product, title: 'Items', onTap: () { Get.toNamed('itemsview'); },),
              CardAdminHome(url: AppImageAsset.avatar, title: 'Users', onTap: () {  },),
              CardAdminHome(url: AppImageAsset.notification, title: 'Notification', onTap: () {  },),
              CardAdminHome(url: AppImageAsset.message, title: 'Message', onTap: () {  },),
              CardAdminHome(url: AppImageAsset.product, title: 'Orders', onTap: () { Get.toNamed('ordersscreen'); },)
            ],
          )
        ],
      )
    );
  }
}