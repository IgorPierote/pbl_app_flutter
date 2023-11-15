import 'dart:math';

class Projectile {
  final double angle;
  final double initialSpeed;
  final double initialDistance;
  final double gravityEffect;

  Projectile(
      {required this.angle,
      required this.initialSpeed,
      required this.initialDistance,
      required this.gravityEffect});

  double calculateTrajectory(double time) {
    double angleInRadians = angle * (pi / 180);
    return initialDistance +
        initialSpeed * time * cos(angleInRadians) -
        0.5 * gravityEffect * pow(time, 2);
  }

  double calculateInitialSpeed(double targetHeight, double time) {
    double angleInRadians = angle * (pi / 180);
    return (targetHeight -
            initialDistance +
            0.5 * gravityEffect * pow(time, 2)) /
        (time * cos(angleInRadians));
  }

  double calculateTime(double targetHeight) {
    double angleInRadians = angle * (pi / 180);
    return (targetHeight - initialDistance) /
        (initialSpeed * cos(angleInRadians));
  }

  bool isAscending(double time) {
    double angleInRadians = angle * (pi / 180);
    return initialSpeed * sin(angleInRadians) - gravityEffect * time > 0;
  }

  void plotGraph(double targetHeight, double time) {
    // Implementação do gráfico aqui
  }
}

void main() {
  var projectile = Projectile(
      angle: 45, initialSpeed: 20, initialDistance: 0, gravityEffect: 9.8);
  double targetHeight = 100;

  double time = projectile.calculateTime(targetHeight);
  double initialSpeed = projectile.calculateInitialSpeed(targetHeight, time);
  bool isAscending = projectile.isAscending(time);

  print('Velocidade inicial necessária: $initialSpeed');
  print('Tempo até atingir o alvo: $time');
  print(
      'O projétil está em movimento ${isAscending ? 'ascendente' : 'descendente'} quando atinge o alvo');

  projectile.plotGraph(targetHeight, time);
}
