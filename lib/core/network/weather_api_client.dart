import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/config/app_config.dart';

class WeatherApiClient {
  final http.Client httpClient;
  WeatherApiClient({required this.httpClient});

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final url = Uri.parse(
      '${AppConfig.baseUrl}/weather?q=$cityName&appid='
      '${AppConfig.apiKey}&units=metric',
    );

    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar clima');
    }

    return jsonDecode(response.body);
  }
}
