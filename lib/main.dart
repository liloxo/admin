import 'package:admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/class/initialbindings.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller =   Get.put(LocaleController()) ;
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      initialRoute: "/",
      initialBinding: InitialBindings(),
      //home: const Language(),
      //routes: routes,
      getPages: routes
    );
  }
}

