import '../../core/services/weatherservice.dart';
import '../../domain/entities/weather.dart';
import '../models/weather_model.dart';

/// Interface que define o contrato do repositório
abstract class WeatherRepository {
  Future<Weather> getWeather(String cityName);
}

/// Implementação concreta do repositório
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService service;

  WeatherRepositoryImpl(this.service);

  /// Busca os dados do clima e converte para a entidade de domínio
  @override
  Future<Weather> getWeather(String cityName) async {
    final json = await service.getWeatherData(cityName);
    return WeatherModel.fromJson(json);
  }
}
