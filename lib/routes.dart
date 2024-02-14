import 'package:admin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:admin/view/screen/auth/login.dart';
import 'package:admin/view/screen/auth/signup.dart';
import 'package:admin/view/screen/auth/success_signup.dart';
import 'package:admin/view/screen/auth/verificationcodesignup.dart';
import 'package:admin/view/screen/categories/add.dart';
import 'package:admin/view/screen/categories/edit.dart';
import 'package:admin/view/screen/categories/view.dart';
import 'package:admin/view/screen/items/add.dart';
import 'package:admin/view/screen/items/edit.dart';
import 'package:admin/view/screen/items/view.dart';
import 'package:admin/view/screen/language.dart';
import 'package:admin/view/screen/onboarding.dart';
import 'package:admin/view/screen/orders/details.dart';
import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/ordersscreen.dart';
import 'package:get/get.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/",                     page: () => const Language(),middlewares: [MyMiddleWare()]),
  GetPage(name: "/login",                page: () => const Login()),
  GetPage(name: "/signup",               page: () => const SignUp()),
  GetPage(name: "/forgetpassword",       page: () => const ForgetPassword()),
  GetPage(name: "/verifycode",           page: () => const VerifyCode()),
  GetPage(name: "/resetpassword",        page: () => const ResetPassword()),
  GetPage(name: "/successresetpassword", page: () => const SuccessResetPassword()),
  GetPage(name: "/successsignup",        page: () => const SuccessSignUp()),
  GetPage(name: "/verifycodesignup",     page: () => const VerifyCodeSignUp()),
  GetPage(name: "/onboarding",           page: () => const OnBoarding()),
  GetPage(name: "/homepage",             page: () => const HomePage()),
  GetPage(name: "/ordersdetails",        page: () => const OrdersDetails()),
  GetPage(name: "/categoriesview",       page: () => const CategoriesView()),
  GetPage(name: "/categoriesadd",        page: () => const CategoriesAdd()),
  GetPage(name: "/categoriesedit",       page: () => const CategoriesEdit()),
  GetPage(name: "/itemsedit",            page: () => const ItemsEdit()),
  GetPage(name: "/itemsadd",             page: () => const ItemsAdd()),
  GetPage(name: "/itemsview",            page: () => const ItemsView()),
  GetPage(name: "/ordersscreen",         page: () => const OrdersScreen()),
  
];