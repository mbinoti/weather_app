import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/presentation/cubits/weather_cubit.dart';

import 'core/network/weather_api_client.dart';
import 'core/services/weatherservice.dart';
import 'data/repositories/weather_repository.dart';
import 'domain/usecases/get_weather_usecase.dart';
import 'presentation/screens/weather_screen.dart';

void main() {
  // Instancia o cliente HTTP
  final httpClient = http.Client();

  // Camada de rede (facade)
  final apiClient = WeatherApiClient(httpClient: httpClient);
  final service = WeatherService(apiClient);

  // Repositório (implementa a lógica de negócio)
  final repository = WeatherRepositoryImpl(service);

  // Caso de uso (domínio)
  final useCase = GetWeatherUseCase(repository);

  runApp(MyApp(useCase));
}

class MyApp extends StatelessWidget {
  final GetWeatherUseCase useCase;

  const MyApp(this.useCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => WeatherCubit(useCase),
        child: WeatherScreen(),
      ),
    );
  }
}
