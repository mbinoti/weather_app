// domain/entities/weather.dart
/// Entidade do domínio que representa os dados de clima
class Weather {
  final String cityName;
  final double temperature;
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
  });
}
