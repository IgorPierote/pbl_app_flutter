import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CannonCardWidget extends StatelessWidget {
  final String subTitle;
  final Function onTapCannon;

  const CannonCardWidget({
    super.key,
    required this.subTitle,
    required this.onTapCannon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        child: Card(
          child: ListTile(
            leading: SizedBox(
              child: Image.asset(
                getImageAsset('cannon.png'),
              ),
            ),
            title: Text('Distancia do canhão'),
            subtitle: Text(subTitle),
            trailing: Icon(
              Icons.navigate_next,
              size: 48,
            ),
            isThreeLine: true,
          ),
        ),
        onTap: () {
          onTapCannon();
        },
      ),
    );
  }
}
