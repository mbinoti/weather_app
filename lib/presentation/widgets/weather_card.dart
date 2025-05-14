import 'package:flutter/material.dart';

import '../../domain/entities/weather.dart';

/// Componente visual que exibe os dados de clima
class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${weather.cityName} - ${weather.temperature}°C'),
        subtitle: Text(weather.description),
      ),
    );
  }
}
