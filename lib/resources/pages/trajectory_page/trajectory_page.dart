import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Projetil {
  double v0;
  final double theta;
  final double g;

  Projetil(this.theta, this.v0, [this.g = 9.8]);

  double get vx => v0 * math.cos(theta * math.pi / 180); // Horizontal velocity
  double get vy => v0 * math.sin(theta * math.pi / 180); // Vertical velocity
  double tempoDeVoo() => 2 * vy / g; // Time of flight
  double alturaMaxima() => (vy * vy) / (2 * g); // Maximum height
  double alcance() => vx * tempoDeVoo(); // Range
  double equacaoDaTrajetoria(double t) =>
      vy * t - 0.5 * g * t * t; // Trajectory equation
}

class Meteoro {
  final double H;
  final double g;

  Meteoro(this.H, [this.g = 9.8]);

  double tempoDeQueda() => math.sqrt(2 * H / g); // Time of fall
  double equacaoDaTrajetoria(double t) =>
      H - 0.5 * g * t * t; // Trajectory equation
}

double? encontrarIntersecao(Projetil projetil, Meteoro meteoro) {
  double t = 0;
  double dt = 0.001; // Decreased to increase precision
  while (t < meteoro.tempoDeQueda()) {
    double diff =
        projetil.equacaoDaTrajetoria(t) - meteoro.equacaoDaTrajetoria(t);
    if (diff.abs() <= 1) {
// Margin of error of 1
      return t;
    }
    t += dt;
  }
  return null;
}

List<FlSpot> projetilSpots = [];
List<FlSpot> meteoroSpots = [];

void simular(double theta, double H) {
  double v0 = 1.0; // Initial velocity of the projectile
  var meteoro = Meteoro(H);
  double? tempoDeIntersecao;
  Projetil projetil;

  do {
    projetil = Projetil(theta, v0);
    tempoDeIntersecao = encontrarIntersecao(projetil, meteoro);
    v0 += 1;
  } while (tempoDeIntersecao == null);

  for (double t = 0; t <= tempoDeIntersecao; t += 1) {
    double xProjetil = projetil.vx * t;
    double yProjetil = projetil.equacaoDaTrajetoria(t);
    double yMeteoro = meteoro.equacaoDaTrajetoria(t);
    print("No tempo t=$t s:");
    print("O projétil está em X=$xProjetil m, Y=$yProjetil m.");
    print("O meteoro está em Y=$yMeteoro m.");
    projetilSpots.add(FlSpot(xProjetil, yProjetil));
    meteoroSpots.add(FlSpot(xProjetil, yMeteoro));
  }

  var alturaIntersecao = projetil.equacaoDaTrajetoria(tempoDeIntersecao);
  var movimento = projetil.vy - projetil.g * tempoDeIntersecao > 0
      ? "ascendente"
      : "descendente";
  print("O projétil atingiu o meteoro em t=${tempoDeIntersecao}s.");
  print("A velocidade inicial do projétil é ${projetil.v0} m/s.");
  print("A altura em que o meteoro foi interceptado é ${alturaIntersecao} m.");
  print("O movimento é $movimento.");
}

FlTitlesData get titlesData => FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles,
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: leftTitles,
      ),
    );

Widget leftTitlesWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0';
      break;
    case 1000:
      text = '1000 M';
      break;
    case 2000:
      text = '2000 M';
      break;
    case 3000:
      text = '3000 M';
      break;
    case 4000:
      text = '4000 M';
      break;
    default:
      return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.center);
}

SideTitles get leftTitles => SideTitles(
    getTitlesWidget: leftTitlesWidget,
    showTitles: true,
    interval: 1,
    reservedSize: 40);

Widget bottomTitleWidget(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
  Widget text;
  switch (value.toInt()) {
    case 250:
      text = const Text('250 M', style: style);
      break;
    case 500:
      text = const Text('500 M', style: style);

      break;
    case 750:
      text = const Text('750 M', style: style);

      break;
    case 1000:
      text = const Text('1000 M', style: style);
      break;
    default:
      return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      reservedSize: 32,
      interval: 1,
      getTitlesWidget: bottomTitleWidget,
    );

FlGridData get gridData => FlGridData(show: false);

FlBorderData get boarderData => FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 4),
        left: const BorderSide(color: Colors.grey),
        top: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent),
      ),
    );

LineChartBarData get LineChartBarData1 => LineChartBarData(
      isCurved: true,
      color: Colors.purple,
      barWidth: 6,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: projetilSpots,
    );

LineChartBarData get LineChartBarData2 => LineChartBarData(
      isCurved: true,
      color: Colors.red,
      barWidth: 6,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: meteoroSpots,
    );

List<LineChartBarData> get lineBarsData => [
      LineChartBarData1,
      LineChartBarData2,
    ];

LineChartData get sampleData1 => LineChartData(
      gridData: gridData,
      titlesData: titlesData,
      borderData: boarderData,
      lineBarsData: lineBarsData,
      minX: 0,
      maxX: 1000,
      minY: 0,
      maxY: 4000,
    );

class TrajectoryPage extends NyStatefulWidget {
  static const path = '/shoot_page';

  @override
  _TrajectoryState createState() => _TrajectoryState();
}

class _TrajectoryState extends NyState<TrajectoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: SafeArea(
          child: Container(
            width: 400,
            height: 400,
            child: _lineChart(),
          ),
        ),
      ),
    );
  }
}

class _lineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
    );
  }
}
