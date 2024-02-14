import 'package:admin/view/screen/orders/accepted.dart';
import 'package:admin/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/orders/archive.dart';

abstract class OrdersScreenController extends GetxController{
  changePage(int i);
}

class OrdersScreenControllerImp extends OrdersScreenController{

  int currentPage = 0;

  List<Widget> pages = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView()
  ];
  List<IconData> icons = [
    Icons.home,
    Icons.shopping_cart_sharp,
    Icons.archive_outlined,
  ];
  List titlebottomappbar = [
    "Pending" , 
    "Accepted",
    "Archive",
  ] ; 

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

}