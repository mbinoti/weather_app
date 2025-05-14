import '../network/weather_api_client.dart';

class WeatherService {
  final WeatherApiClient client;

  WeatherService(this.client);

  /// Obtém os dados crus de clima da cidade
  Future<Map<String, dynamic>> getWeatherData(String cityName) {
    return client.fetchWeather(cityName);
  }
}
