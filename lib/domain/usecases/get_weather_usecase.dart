import '../../data/repositories/weather_repository.dart';
import '../entities/weather.dart';

/// Caso de uso que obtém o clima de uma cidade
class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Weather> call(String cityName) {
    return repository.getWeather(cityName);
  }
}
