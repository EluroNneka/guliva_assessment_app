import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guliva_assessment_app/core/utils/config.dart';
import 'package:guliva_assessment_app/nav/routes.dart';
import 'package:guliva_assessment_app/ui/views/login/login_view.dart';
import 'package:guliva_assessment_app/ui/views/splash_view.dart';

import 'core/utils/overlay_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Config.loadEnv();

  SystemChrome.setSystemUIOverlayStyle(OverlayUtil.lightStat);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 812),
      builder: (c, _) => GetMaterialApp(
        home: const SplashView(),
        getPages: Routers().views,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
