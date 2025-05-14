// data/models/weather_model.dart
import '../../domain/entities/weather.dart';

/// Modelo que adapta o JSON para a entidade do domínio
class WeatherModel extends Weather {
  WeatherModel({
    required super.cityName,
    required super.temperature,
    required super.description,
  });

  /// Constrói o modelo a partir de um JSON
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}
