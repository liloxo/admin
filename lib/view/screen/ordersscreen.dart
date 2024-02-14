import 'package:admin/controller/orderscreen_controller.dart';
import 'package:admin/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenControllerImp());
    return GetBuilder<OrdersScreenControllerImp>(builder: (controller)
      => Scaffold(
        drawer: const Drawer(),
      appBar: AppBar(title: const Text('Orders'),),
      bottomNavigationBar: const CustomBottomAppBarHome(),
      body: controller.pages.elementAt(controller.currentPage),
      )
    );
  }
}