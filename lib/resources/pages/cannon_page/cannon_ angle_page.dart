import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CannonAnglePage extends NyStatefulWidget {
  final HomeController controller = HomeController();

  static const path = '/cannon_angle';

  @override
  _CannonAnglePage createState() => _CannonAnglePage();
}

class _CannonAnglePage extends NyState<CannonAnglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insira o ângulo do canhão'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              Card(
                child: Image.asset(
                  getImageAsset('CannonAngle.png'),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: widget.controller.controllerText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Insira o ângulo',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                autofocus: true,
              ),
              SizedBox(height: 16),
              FloatingActionButton.extended(
                onPressed: () async {
                  Backpack.instance.set(
                      'anguloDoCanhao', widget.controller.controllerText.text);
                  var angulo = Backpack.instance.read('anguloDoCanhao');
                  var distancia = Backpack.instance.read('distanciaCanhao');
                  var altura = Backpack.instance.read('alturaMeteor');
                  print(angulo);
                  print(distancia);
                  print(altura);
                },
                label: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Atirar"),
                    Container(width: 8),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
