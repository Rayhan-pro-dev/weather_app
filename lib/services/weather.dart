import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/location.dart';

class WeatherModel {
  Future getCityWeather(cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        api:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=1e27b875e2c1d73c1f66db3dd8b97f8a&units=metric');
    var cityWeather = await networkHelper.getData();
    return cityWeather;
  }

  Future<dynamic> getLocationData() async {
    GetLocation l = GetLocation();
    await l.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(
        api:
            'https://api.openweathermap.org/data/2.5/weather?lat=${l.latitude}&lon=${l.longitude}&appid=1e27b875e2c1d73c1f66db3dd8b97f8a&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
