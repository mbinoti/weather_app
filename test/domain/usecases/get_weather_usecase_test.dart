// test/domain/usecases/get_weather_usecase_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

import 'package:weather_app/domain/usecases/get_weather_usecase.dart';

/// Mock da interface WeatherRepository
class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetWeatherUseCase useCase;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    useCase = GetWeatherUseCase(mockRepository);
  });

  test('deve retornar um Weather da cidade fornecida', () async {
    const tCityName = 'Franca';
    final tWeather = Weather(
      cityName: tCityName,
      temperature: 25.0,
      description: 'Ensolarado',
    );

    // Configura o mock para retornar um Weather específico
    when(() => mockRepository.getWeather(tCityName))
        .thenAnswer((_) async => tWeather);

    final result = await useCase(tCityName);

    expect(result, equals(tWeather));
    verify(() => mockRepository.getWeather(tCityName)).called(1);
  });
}
