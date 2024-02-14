import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/services/services.dart';
import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int i);
}

class OnBoardingControllerImp extends OnBoardingController{

  late PageController pageController;
  MyServices myServices = Get.find();
  int currentpage = 0;

  @override
  next() {
    currentpage++;
    if(currentpage > onBoardingList.length - 1){
       Get.offAllNamed("login");
       myServices.sharedPreferences.setString("step", "1");
    }else{
    pageController.animateToPage(currentpage, duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int i) {
    currentpage = i;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

}