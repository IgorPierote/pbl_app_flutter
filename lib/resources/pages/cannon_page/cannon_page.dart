import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/resources/pages/cannon_page/cannon_%20angle_page.dart';
import 'package:flutter_app/resources/pages/cannon_page/widgets/cannon_card.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CannonSelectionPage extends NyStatefulWidget {
  final HomeController controller = HomeController();

  static const path = '/cannon_selection';

  @override
  _CannonSelectionPage createState() => _CannonSelectionPage();
}

class _CannonSelectionPage extends NyState<CannonSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a distancia do canhão'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CannonCardWidget(
              subTitle: '1000M',
              onTapCannon: () {
                Backpack.instance.set('distanciaCanhao', 1000);
                Navigator.pushNamed(context, CannonAnglePage.path);
              },
            ),
            CannonCardWidget(
              subTitle: '750M',
              onTapCannon: () {
                Backpack.instance.set('distanciaCanhao', 750);
                Navigator.pushNamed(context, CannonAnglePage.path);
              },
            ),
            CannonCardWidget(
              subTitle: '500M',
              onTapCannon: () {
                Backpack.instance.set('distanciaCanhao', 500);
                Navigator.pushNamed(context, CannonAnglePage.path);
              },
            ),
            CannonCardWidget(
              subTitle: '250M',
              onTapCannon: () {
                Backpack.instance.set('distanciaCanhao', 250);
                Navigator.pushNamed(context, CannonAnglePage.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}
