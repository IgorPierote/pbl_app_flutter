import 'package:flutter_app/resources/pages/meteor_page/meteor_selection_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import '/app/controllers/home_controller.dart';

class HomePage extends NyPage<HomeController> {
  static String path = '/home';

  @override
  init() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-Vindo ao projeto PBL 2023'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: Row(
                children: [
                  Text('Começar'),
                  Icon(Icons.play_arrow_rounded),
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, MeteorSelectionPage.path);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(180, 80),
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                shape: StadiumBorder(),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              child: Row(
                children: [
                  Text('Lista de Acertos'),
                  Icon(Icons.list),
                ],
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(270, 80),
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                shape: StadiumBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool get isThemeDark =>
      ThemeProvider.controllerOf(context).currentThemeId ==
      getEnv('DARK_THEME_ID');
}
