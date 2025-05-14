import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  final http.Client httpClient;
  WeatherApiClient({required this.httpClient});

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=a665b29a2c6e1dd41ffc791e0d7a8263&units=metric');

    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar clima');
    }

    return jsonDecode(response.body);
  }
}
