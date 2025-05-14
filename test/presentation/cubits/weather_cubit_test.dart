import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/presentation/cubits/weather_cubit.dart';

/// Classe mock para o caso de uso GetWeatherUseCase
class MockGetWeatherUseCase extends Mock implements GetWeatherUseCase {}

void main() {
  late WeatherCubit cubit;
  late MockGetWeatherUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetWeatherUseCase();
    cubit = WeatherCubit(mockUseCase);
  });

  test('deve emitir [loading, sucesso] quando o clima é carregado com sucesso',
      () async {
    const tCity = 'Franca';
    final tWeather = Weather(
      cityName: tCity,
      temperature: 22.5,
      description: 'Parcialmente nublado',
    );

    // Configura o mock para retornar um Weather
    when(() => mockUseCase(tCity)).thenAnswer((_) async => tWeather);

    // Espera que os estados sejam emitidos em ordem
    expectLater(
      cubit.stream,
      emitsInOrder([
        isA<WeatherState>().having((s) => s.loading, 'loading', true),
        isA<WeatherState>().having((s) => s.weather, 'weather', tWeather),
      ]),
    );

    await cubit.fetchWeather(tCity);
  });

  test('deve emitir [loading, erro] quando ocorre uma exceção', () async {
    const tCity = 'Erroville';

    // Configura o mock para lançar exceção
    when(() => mockUseCase(tCity)).thenThrow(Exception('Erro na API'));

    // Espera que os estados sejam emitidos com erro
    expectLater(
      cubit.stream,
      emitsInOrder([
        isA<WeatherState>().having((s) => s.loading, 'loading', true),
        isA<WeatherState>().having((s) => s.error, 'error', contains('Erro')),
      ]),
    );

    await cubit.fetchWeather(tCity);
  });
}
