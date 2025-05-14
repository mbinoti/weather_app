import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;

import '../cubits/weather_cubit.dart';
import '../widgets/weather_card.dart';

/// Tela principal onde o usuário digita a cidade e vê o clima
class WeatherScreen extends StatelessWidget {
  final cityController = TextEditingController();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clima')),
      body: Column(
        children: [
          TextField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'Cidade')),
          ElevatedButton(
            onPressed: () {
              final cubit = context.read<WeatherCubit>();
              cubit.fetchWeather(cityController.text);
            },
            child: const Text('Buscar Clima'),
          ),
          Expanded(
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.error != null) {
                  return Center(child: Text('Erro: ${state.error}'));
                }
                if (state.weather != null) {
                  return WeatherCard(weather: state.weather!);
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
