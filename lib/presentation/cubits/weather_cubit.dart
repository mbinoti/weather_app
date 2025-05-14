import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_weather_usecase.dart';

/// Estado do cubit
class WeatherState {
  final bool loading;
  final Weather? weather;
  final String? error;

  WeatherState({this.loading = false, this.weather, this.error});
}

/// Gerencia o estado da tela de clima
class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase useCase;

  WeatherCubit(this.useCase) : super(WeatherState());

  /// Busca o clima da cidade e atualiza o estado
  Future<void> fetchWeather(String cityName) async {
    emit(WeatherState(loading: true));

    try {
      final weather = await useCase(cityName);
      emit(WeatherState(weather: weather));
    } catch (e) {
      emit(WeatherState(error: e.toString()));
    }
  }
}
