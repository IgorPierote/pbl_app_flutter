import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/resources/pages/cannon_page/cannon_page.dart';
import 'package:flutter_app/resources/pages/meteor_page/widgets/meteor_card.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MeteorSelectionPage extends NyStatefulWidget {
  final HomeController controller = HomeController();

  static const path = '/meteor_selection';

  @override
  _MeteorSelectionPage createState() => _MeteorSelectionPage();
}

class _MeteorSelectionPage extends NyState<MeteorSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a altura do meteoro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MeteorCardWidget(
              subTitle: '4000M',
              onTapMeteor: () {
                Backpack.instance.set('alturaMeteor', 4000);
                Navigator.pushNamed(context, CannonSelectionPage.path);
              },
            ),
            MeteorCardWidget(
              subTitle: '3000M',
              onTapMeteor: () {
                Backpack.instance.set('alturaMeteor', 3000);
                Navigator.pushNamed(context, CannonSelectionPage.path);
              },
            ),
            MeteorCardWidget(
              subTitle: '2000M',
              onTapMeteor: () {
                Backpack.instance.set('alturaMeteor', 2000);
                Navigator.pushNamed(context, CannonSelectionPage.path);
              },
            ),
            MeteorCardWidget(
              subTitle: '1000M',
              onTapMeteor: () {
                Backpack.instance.set('alturaMeteor', 1000);
                Navigator.pushNamed(context, CannonSelectionPage.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}
