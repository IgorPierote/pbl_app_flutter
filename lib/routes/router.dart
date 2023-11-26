import 'package:flutter_app/resources/pages/cannon_page/cannon_%20angle_page.dart';
import 'package:flutter_app/resources/pages/cannon_page/cannon_page.dart';
import 'package:flutter_app/resources/pages/meteor_page/meteor_selection_page.dart';
import 'package:flutter_app/resources/pages/trajectory_page/trajectory_page.dart';

import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      router.route(HomePage.path, (context) => HomePage(), initialRoute: true);

      router.route(
          MeteorSelectionPage.path, (context) => MeteorSelectionPage());

      router.route(
          CannonSelectionPage.path, (context) => CannonSelectionPage());

      router.route(CannonAnglePage.path, (context) => CannonAnglePage());

      router.route(TrajectoryPage.path, (context) => TrajectoryPage());
      // router.route(NewPage.path, (context) => NewPage(), transition: PageTransitionType.fade);
    });
