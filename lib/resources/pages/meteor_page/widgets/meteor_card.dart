import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MeteorCardWidget extends StatelessWidget {
  final String subTitle;
  final Function onTapMeteor;

  const MeteorCardWidget({
    super.key,
    required this.subTitle,
    required this.onTapMeteor,
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
                getImageAsset('Meteor.png'),
              ),
            ),
            title: Text('Altura do Meteoro'),
            subtitle: Text(subTitle),
            trailing: Icon(
              Icons.navigate_next,
              size: 48,
            ),
            isThreeLine: true,
          ),
        ),
        onTap: () {
          onTapMeteor();
        },
      ),
    );
  }
}
