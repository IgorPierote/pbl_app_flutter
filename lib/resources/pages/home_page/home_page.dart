import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
              routeTo(
                '/meteor_selection',
                navigationType: NavigationType.pushReplace,
                pageTransition: PageTransitionType.fade,
              );
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
    );
  }
}
