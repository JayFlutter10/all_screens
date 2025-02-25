import 'package:flutter/material.dart';
import 'package:side_bizbooster/Testing/Color/color_test_view.dart';
import 'package:side_bizbooster/academy/view/video_academy_main.dart';
import 'package:side_bizbooster/all_screen.dart';
import 'package:side_bizbooster/chart.dart';
import 'package:side_bizbooster/favourite/view/favourite_view_screen.dart';
import 'package:side_bizbooster/packages/views/package_view_screen.dart';
import 'package:side_bizbooster/packages/views/selected_package_screen.dart';
import 'package:side_bizbooster/shorts/views/navigate_to_shorts.dart';
import 'package:side_bizbooster/tandc_5X/View/terms_conditions.dart';

import 'academy/view/certificate_view.dart';
import 'academy/view/live_webinar_view.dart';
import 'academy/view/training_view.dart';
import 'academy/view/two_min_gyan_view.dart';
import 'academy/view/webinar_view.dart';
import 'offer/views/rewards_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        '/certificate_view': (context) => CertificateView(),
        '/two_min_gyan_view': (context) => TwoMinGyanView(),
        '/live_webinar_view': (context) => LiveWebinarView(),
        '/webinar_view': (context) => WebinarView(),
        '/training_view': (context) => TrainingView(),
        '/video_academy_main':(context)=>VideoAcademy(),
        '/favourite_view_screen':(context)=>FavouriteViewScreen(),
        '/package_view_screen':(context)=>PackageViewScreen(),
        '/selected_package_screen':(context)=>SelectedPackageScreen(),
        '/rewards_view':(context)=>RewardsView(),
        '/navigate_to_shorts':(context)=>NavigateToShorts(),
        '/terms_conditions':(context)=>TermsConditions(),
        '/color_test_view':(context)=>ColorTestView(),
        '/chart':(context)=>SemiCircleChart(),
      },

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AllScreen(),
    );
  }
}