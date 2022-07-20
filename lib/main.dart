import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:note_app/core/theme/app_theme.dart';
import 'package:note_app/data/provider/my_db.dart';
import 'package:note_app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MyDB.createInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyNote App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      locale: Locale('en', 'US'),
    );
    // return FutureBuilder<MyDB>(
    //     future: MyDB.getInstance(),
    //     builder: ((context, snapshot) {
    //       return GetMaterialApp(
    //         title: 'MyNote App',
    //         debugShowCheckedModeBanner: false,
    //         initialRoute: Routes.INITIAL,
    //         theme: appThemeData,
    //         defaultTransition: Transition.fade,
    //         getPages: AppPages.pages,
    //         locale: Locale('en', 'US'),
    //       );
    //     }));
  }
}
