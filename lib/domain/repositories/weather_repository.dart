import '../entities/weather.dart';

/// Interface que define o contrato do repositório
abstract class WeatherRepository {
  Future<Weather> getWeather(String cityName);
}
